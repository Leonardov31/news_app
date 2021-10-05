import 'package:flutter/material.dart';

import '../../../viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<NewsArticleViewModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            leading: SizedBox(
              width: 100,
              child: article.imageUrl != "Null"
                  ? Image.network(articles[index].imageUrl)
                  : Image.asset("assets/images/news-placeholder.png"),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            title: Text(article.title),
          ),
        );
      },
    );
  }
}
