import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/news_article_list_view_model.dart';
import 'widgets/news_list.dart';

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

  Widget _buildList(NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingStatus) {
      case LoadingStatus.searching:
        return const Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return const Align(child: Text("No results found"));
      case LoadingStatus.completed:
        return Expanded(child: NewsList(articles: viewModel.articles));
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
              onSubmitted: (String value) async {
                if (value.isNotEmpty) {
                  return _viewModel.search(value);
                }
              },
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
            _buildList(_viewModel),
          ],
        ),
      ),
    );
  }
}
