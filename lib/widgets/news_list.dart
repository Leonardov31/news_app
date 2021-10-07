import 'package:flutter/material.dart';

import '../viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    required this.articles,
    required this.onTap,
  }) : super(key: key);

  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Container(
          // margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: () => onTap(article),
            contentPadding: const EdgeInsets.all(10.0),
            title: Container(
              height: 200,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: article.imageUrl != "Null"
                  ? Image.network(
                      articles[index].imageUrl,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.asset(
                      "assets/images/news-placeholder.png",
                      fit: BoxFit.fitWidth,
                    ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
