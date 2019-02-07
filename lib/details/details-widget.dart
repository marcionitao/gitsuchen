import 'package:flutter/material.dart';
import 'package:gitsearch/models/search-item.dart';

class DetailsWidget extends StatefulWidget {

  // responsavel pelo o conteudo do model
  final SearchItem item;

  // construtor
  const DetailsWidget({Key key, this.item}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {

    // traz as dimensões do device e é usado para responsividade
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      // permite a rolagem
      body: SingleChildScrollView(
        // para pegar toda a tela
        child: Container(
          width: size.width,
          child: Column(
            // alinha horizontal
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // melhorar a altura
              Container(height: 20,),
              // Hero serve para animação de transição de telas
              Hero(
                tag: widget.item.url,
                // add widget para acessar o item(widget.item?)
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    widget.item?.avatarUrl ?? "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"
                  ),
                ),
              ),
              // melhorar a altura
              Container(height: 10,),
              Text(
                widget.item.fullName, 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18, 
                  color: Colors.grey[700]
                ),
              ),
              // melhorar a altura
              Container(height: 10,),
              Text(
                widget.item.url, 
                style: TextStyle(
                  fontSize: 14, 
                  color: Colors.grey[700]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}