import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';
import 'package:provider/provider.dart';

import '../viewmodels/news_article_list_view_model.dart';
import '../widgets/news_list.dart';
import 'news_article_detail_page.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _showNewsArticleDetails(
    BuildContext context,
    NewsArticleViewModel article,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailPage(article: article),
      ),
    );
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingStatus) {
      case LoadingStatus.searching:
        return const CircularProgressIndicator();
      case LoadingStatus.empty:
        return const Text("No results found");
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: viewModel.articles,
            onTap: (article) => _showNewsArticleDetails(context, article),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<NewsArticleListViewModel>(context);
    final _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top News"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              onSubmitted: (String value) => _viewModel.search(value),
              decoration: InputDecoration(
                hintText: "Search news",
                filled: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () => _textController.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            _buildList(context, _viewModel),
          ],
        ),
      ),
    );
  }
}
