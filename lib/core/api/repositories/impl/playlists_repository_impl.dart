import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/playlist_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/playlists/playlist_response.model.dart';
import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';
import 'package:music_playce_sdk/core/api/repositories/playlists_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

import '../../models/users/user_playlists_response.model.dart';
import '../../models/users/user_playlists_response.model.dart';

class PlaylistsRepositoryImpl implements PlaylistsRepository {
  final MusicPlayceHttp httpClient;

  PlaylistsRepositoryImpl({
    @required this.httpClient,
  });

  @override
  Future<PlaylistResponse> getAPlaylist(String playlistId) async {
    final response = await httpClient.get(
      PlaylistEndpoint.getAPlaylist(playlistId),
    );

    return PlaylistResponse.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<PlaylistResponse> addAPostToPlaylist(
      String playlistId, Post post) async {
    final response = await httpClient.put(
      PlaylistEndpoint.addAPostToPlaylist(playlistId),
      body: {
        'id_post': post.id,
      },
    );
    return PlaylistResponse.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<PlaylistResponse> deleteAPostFromAPlaylist(
      String playlistId, String postId) async {
    final response = await httpClient.delete(
      PlaylistEndpoint.deleteAPostFromAPlaylist(playlistId, postId),
    );

    return PlaylistResponse.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<UserPlaylistsResponse> createPlaylist(String name) async {
    if (name == "Favoritas") {
      return null;
    }

    try {
      final response = await httpClient.post(
        PlaylistEndpoint.createPlaylist,
        body: {
          'name': name,
        },
      );

     final data = jsonDecode(response?.body)['data'];

      if (response.statusCode == 200) {
        return UserPlaylistsResponse.fromJson(data);
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> deleteAPlaylist(String playlistId) async {
    try {
      final response = await httpClient.delete(
        PlaylistEndpoint.deleteAPlaylist(playlistId),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
