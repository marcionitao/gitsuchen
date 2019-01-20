import 'package:gitsearch/home/home-service.dart';
import 'package:gitsearch/models/search-result.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

  //instaciar a classe de serviço
  final HomeService _service = new HomeService();
  // BehaviorSubject é um controldaor de fluxo  que permite começarmos com valor
  final _searchController = new BehaviorSubject<String>();
  //definir o Fluxo
  Observable<String> get searchFlux => _searchController.stream;
  //definir o evento
  Sink<String> get searchEvent => _searchController.sink;

  // recebe o resultado da api dentro de um fluxo
  Observable<SearchResult> listItems = Stream.empty(); // valor vazio

  // construtor
  HomeBloc() {
    listItems = searchFlux
    .distinct() // não permite eventos duplicado
    .debounce(Duration(milliseconds: 300)) // obriga o sistema a esperar este espaço de tempo
    .asyncMap(_service.search) // valor digitado pelo usuario
    .switchMap((dados) => Observable.just(dados)); // vai oferecer o dado mais atual da api, ou seja, numa pesquisa o valor apresentado será o ultimo digitado pelo utilizador
  }

  // metodo usado para fecha o fluxo
  void dispose() {
    _searchController?.close();
  }
}