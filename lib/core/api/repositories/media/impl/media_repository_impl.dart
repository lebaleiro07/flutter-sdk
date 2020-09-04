import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/media_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:music_playce_sdk/core/api/models/posts/media.model.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';
import '../media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MusicPlayceHttp httpClient;

  MediaRepositoryImpl({
    @required this.httpClient
  });

  @override
  Future<Either<Exception, DataWithCursor<Media>>> getAllMedia(
      {String userId, int limit = 8, String page}) async {
    try {
      final result = await httpClient.get(
          "${MediaEndpoint.getAllMedia}?limit=$limit&id_profile=$userId" +
              (page != null ? "&next=$page" : ""));

      final data = jsonDecode(result.body);

      final media =
      data['data'].map<Media>((post) => Media.fromMap(post)).toList();

      final cursor = Cursor.fromMap(data['cursor']);

      return right(DataWithCursor<Media>(cursor: cursor, data: media));
    } catch (e, s) {
      return left(e);
    }
  }

}
