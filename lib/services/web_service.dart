import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/utils/constants.dart';

import '../models/news_article.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadlineByKeyword(String keyword) async {
    final response =
        await http.get(Uri.parse(Constants.headlinesByKeywordUrl(keyword)));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];

      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final url = Uri.parse(Constants.topHeadlinesUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];

      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }
}
