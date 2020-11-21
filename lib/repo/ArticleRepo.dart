import 'dart:convert';
import 'package:flutter_bloc_pattern/constant/UrlConstants.dart';
import 'package:flutter_bloc_pattern/model/article_data.dart';

import 'package:http/http.dart' as http;

abstract class ArticleRepo {
  Future<List<Articles>> getArticles();
}

class ArticleRepoImpl implements ArticleRepo {
  @override
  Future<List<Articles>> getArticles() async {
    var url = UrlConstants.url;

    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      var data = json.decode(responce.body);

      List<Articles> ar = ArticleData.fromJson(data).articles;

      return ar;
    } else {
      List<Articles> ar = [];
      return ar;
    }
  }
}
