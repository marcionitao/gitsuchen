import 'package:dio/dio.dart';
import 'package:gitsearch/models/search-result.dart';

class HomeService {
 
  final dio = Dio();

  Future search(String text) async {
    Response response = await dio.get("https://api.github.com/search/repositories?q=${text}");
    print("Response ${response.data['items']}");
    return SearchResult.fromJson(response.data['items']);
  }
}