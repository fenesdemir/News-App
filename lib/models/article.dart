class Article {
  String key;
  String url;
  String description;
  String image;
  String name;
  String source;

  Article(
      {required this.key,
        required this.url,
        required this.description,
        required this.image,
        required this.name,
        required this.source});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      key: json['key'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      source: json['source'] as String,
    );
  }
}