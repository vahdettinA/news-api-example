import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_model.dart';

@immutable
final class NewsService {
  final Dio dio = Dio();
  final String path =
      "https://newsapi.org/v2/everything?q=apple&from=2024-01-30&to=2024-01-30&sortBy=popularity&apiKey=62c7fa17992a424198db14ec324d0004";

  Future<NewsModel?> fecthNews() async {
    var res = await dio.get(path);
    if (res.statusCode == HttpStatus.ok) {
      var body = NewsModel.fromJson(res.data);
      return body;
    }
    return null;
  }
}

NewsService get service => NewsService();
