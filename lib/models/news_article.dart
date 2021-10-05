class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json["title"] ?? "Null",
      description: json["description"] ?? "Null",
      urlToImage: json["urlToImage"] ?? "Null",
      url: json["url"] ?? "Null",
    );
  }
}
