import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/news_list_page.dart';
import 'viewmodels/news_article_list_view_model.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => NewsArticleListViewModel(),
        child: const NewsListPage(),
      ),
    );
  }
}
