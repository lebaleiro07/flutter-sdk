import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/media_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:music_playce_sdk/core/api/models/media/draft.model.dart';
import 'package:music_playce_sdk/core/api/models/posts/media.model.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';
import '../media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MusicPlayceHttp httpClient;

  MediaRepositoryImpl({@required this.httpClient});

  @override
  Future<DataWithCursor<Draft>> getAllDrafts(
      {String userId, int limit = 8, String page}) async {
    try {
      final result = await httpClient.get(
          "${MediaEndpoint.getAllDrafts(userId)}?limit=$limit" +
              (page != null ? "&next=$page" : ""));

      final data = jsonDecode(result.body);

      final drafts =
          data['data'].map<Draft>((draft) => Draft.fromMap(draft)).toList();

      final cursor = Cursor.fromMap(data['cursor']);

      return DataWithCursor<Draft>(cursor: cursor, data: drafts);
    } catch (e, s) {
      return e;
    }
  }

  @override
  Future<Media> getMediaById(String mediaId) async {
    final response = await httpClient.get(
      MediaEndpoint.getMediaById(mediaId),
    );

    return Media.fromMap(jsonDecode(response?.body)['data']);
  }
}
