import 'package:gitsearch/models/search-item.dart';

class SearchResult {
  //variavel vai receber os dados da API
  final List<SearchItem> items;

  // construtor
  SearchResult(this.items);

  // objetivo aqui, é que o JSON seja recebido como uma Lista
  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final listItems = (json as List)
    ?.cast<Map<String, dynamic>>() // uma lista de mapa de string e dinamico
    ?.map((item) {

      return SearchItem.fromJson(item);

    })?.toList();

    return SearchResult(listItems);
  }


}