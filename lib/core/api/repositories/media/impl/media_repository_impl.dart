import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/media_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/media/create_media_response.dart';
import 'package:music_playce_sdk/core/api/models/posts/media.model.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';
import '../media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MusicPlayceHttp httpClient;

  MediaRepositoryImpl({
    @required this.httpClient
  });

  @override
  Future<CreateMediaResponse> uploadMedia(Media media) async {

  }
}
