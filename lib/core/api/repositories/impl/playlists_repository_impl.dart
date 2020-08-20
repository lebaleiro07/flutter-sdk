import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../http/music_playce_http.dart';
import '../../endpoints/playlist_endpoint.dart';
import '../../models/playlists/playlist_response.model.dart';
import '../../models/posts/posts.model.dart';
import '../../models/users/user_playlists_response.model.dart';
import '../playlists_repository.dart';

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
  Future<bool> createPlaylist(String name) async {
    if (name == "Favoritas") {
      return false;
    }

    try {
      final response = await httpClient.post(
        PlaylistEndpoint.createPlaylist,
        body: {
          'name': name,
        },
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
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

  @override
  Future<bool> editAPlaylist(UserPlaylists userPlaylists) async {
    try {
      final response = await httpClient.put(
        PlaylistEndpoint.editAPlaylist(userPlaylists.idPlaylist),
        body: {
          'name': userPlaylists.playlistName,
          'picture': userPlaylists.picture,
        },
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
