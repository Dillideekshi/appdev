import 'dart:convert';
import 'package:appdev/models/news%20app/model/article_model.dart';
import 'package:appdev/models/news%20app/repository/abstract_class_ropository.dart';
import 'package:http/http.dart' as http;
import '../model/articles_list_model.dart';

class NewsApi extends ClassRepository {
  
  var keyApi = "7fbc723478c94e0da798b71a7a0628ed";

  @override
  Future<List<ArticleModel>> getAllNews() async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&apiKey=7fbc723478c94e0da798b71a7a0628ed");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        // here shacked number status code
        print("status code#Amer# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("here Amer Exception code staus");
  }

  @override
  Future<List<ArticleModel>> getCategory(String category) async {
    try {
      var url =
          ("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=7fbc723478c94e0da798b71a7a0628ed");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
            articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        // here shacked number status code
        // ignore: avoid_print
        print("status code#Amer# = ${response.statusCode}");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    throw Exception("here Amer Exception code status");
  }
}