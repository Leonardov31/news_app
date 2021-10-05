import 'package:flutter/material.dart';

import '../services/web_service.dart';
import 'news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  Future<void> search(String keyword) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    final newsArticles = await WebService().fetchHeadlineByKeyword(keyword);
    articles = newsArticles.map((article) {
      return NewsArticleViewModel(article: article);
    }).toList();

    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    final newsArticles = await WebService().fetchTopHeadlines();
    articles = newsArticles.map((article) {
      return NewsArticleViewModel(article: article);
    }).toList();

    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
