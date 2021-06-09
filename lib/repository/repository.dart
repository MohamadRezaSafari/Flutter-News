import 'package:news/model/source_response.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "Here is your api";

  final Dio _dio = Dio();

  var getSourceUrl = "$mainUrl/sources";
  var getTopHeadlinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "us"};
    try {
      Response response = await _dio.get(getSourceUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace : $stacktrace");
      return SourceResponse.withError(error.toString());
    }
  }
}
