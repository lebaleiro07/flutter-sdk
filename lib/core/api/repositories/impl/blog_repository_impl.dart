import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/blog_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/blog/articles_response.dart';
import 'package:music_playce_sdk/core/api/repositories/blog_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class BlogRepositoryImpl implements BlogRepository {
  final MusicPlayceHttp httpClient;

  BlogRepositoryImpl({
    @required this.httpClient,
  });

  @override
  Future<List<ArticlesResponse>> getAllArticles() async {
    try {
      final response = await httpClient.get(BlogEndpoint.getAllArticles);

      final data = jsonDecode(response?.body)['data'];

      return data.map<ArticlesResponse>((articles) => ArticlesResponse.fromJSON(articles)).toList();
    } catch(e, s){
      print("$e $s");
    }
  }
}
