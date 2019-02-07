import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitsearch/details/details-widget.dart';
import 'package:gitsearch/home/home-bloc.dart';
import 'package:gitsearch/models/search-item.dart';
import 'package:gitsearch/models/search-result.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  HomeBloc homeBloc;

  // inicio ciclo de vida da app
  @override
  void initState() {        
    super.initState();
    homeBloc = new HomeBloc();
  }

  @override
  void dispose() {
    homeBloc?.dispose();
    super.dispose();
  }
  // fim ciclo de vida da app

  // onde digitamos a pesquisa
  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: homeBloc.searchEvent.add,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "write here",
          labelText: "Search"
        ),
      ),
    );
  }

  // retorna os itens
  Widget _items(SearchItem item) {
    return ListTile(
      // Hero serve para animação de transição de telas
      leading: Hero(
        tag: item.url,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            item?.avatarUrl ?? "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"
          ),
        )
      ),
      title: Text(item?.fullName ?? "Title"),
      subtitle: Text(item?.url ?? "url"),
      // ação para o botão de detalhes
      onTap: () => Navigator.push(
        context, 
        CupertinoPageRoute(
          builder: (context) => DetailsWidget(item: item))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search"),
      ),
      body: ListView(
        children: <Widget>[
          _textField(),
          // listamos a pesquisa
          StreamBuilder(
            stream: homeBloc.listItems,
            builder: (context, AsyncSnapshot<SearchResult> snapshot) {
              // se o fluxo tiver dados validos retorna uma lista
              return snapshot.hasData ? 
              // expoe uma lista para grande volume de resultados
              ListView.builder(
                shrinkWrap: true, // ajeita a tela
                physics: ClampingScrollPhysics(), // impedide que o list view tenha altura infinita
                itemCount: snapshot.data.items.length,
                itemBuilder: (BuildContext context, int index) {
                  SearchItem item = snapshot.data.items[index];
                  // returna o widget lque lista os itens
                  return _items(item);
                },
              ) : 
              Center(child: CircularProgressIndicator(),);
            },
          )
        ],
      ),
    );
  }
}