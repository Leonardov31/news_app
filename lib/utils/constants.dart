import '../env.dart';

class Constants {
  static const topHeadlinesUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  static headlinesByKeywordUrl(String keyword) =>
      "https://newsapi.org/v2/everything?q=$keyword&apiKey=$apiKey";
}
