import 'package:dio/dio.dart';
import 'package:gitsearch/models/search-result.dart';

class HomeService {
 
  final dio = Dio();

  Future<SearchResult> search(String text) async {
    Response response = await dio.get("https://api.github.com/search/repositories?q=${text}");
    print("Response ${response.data}");
    return SearchResult.fromJson(response.data);
  }
}