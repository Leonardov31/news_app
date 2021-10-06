import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../viewmodels/news_article_view_model.dart';

class NewsArticleDetailPage extends StatelessWidget {
  const NewsArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final NewsArticleViewModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: WebView(
        initialUrl: article.url,
      ),
    );
  }
}
