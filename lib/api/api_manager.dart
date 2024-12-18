import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.authority, ApiConstants.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });
    var response = await http.get(url);
    try {
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.authority, ApiConstants.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    var response = await http.get(url);
    try {
      var json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
