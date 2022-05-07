import 'dart:convert';
import 'dart:io';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final endPointUrl = "https://api.collectapi.com/news/getNews?country=tr&tag=general";

  Future<List<Article>> getArticle() async {
    http.Response res = await http.get(
      Uri.parse(endPointUrl),
      headers: {
        HttpHeaders.authorizationHeader: 'apikey 4VD45iEsAAiWrRweDpvRr8:6FY18Pk5vmXTtkEO9oGPuM',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['result'];

      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      //print("Success!");

      return articles;
    } else {
      throw ("Failed to get the articles!");
    }
  }

}