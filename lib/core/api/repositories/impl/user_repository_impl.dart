import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/user_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/users/user_follow_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_likes_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_playlists_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/users_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class UserRepositoryImpl implements UserRepository {
  final MusicPlayceHttp httpClient;

  UserRepositoryImpl({
    @required this.httpClient,
  });

  @override
  Future<User> getUser(String userId) async {
    final response = await httpClient.get(
      UserEndpoint.getUser(userId),
    );

    return User.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<User> updateUser(User user) async {
    final response = await httpClient.put(
      UserEndpoint.updateUser(user.id),
      body: user.toJson(),
    );

    return User.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<UserLikesResponse> getUserLikes(String userId) async {
    final response = await httpClient.get(
      UserEndpoint.getUserLikes(userId),
    );

    return UserLikesResponse.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<UserFollowResponse> followUser(String userId) async {
    final response = await httpClient.put(
      UserEndpoint.followUser(userId),
    );

    return UserFollowResponse.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<UserFollowResponse> unfollowUser(String userId) async {
    final response = await httpClient.put(
      UserEndpoint.unfollowUser(userId),
    );

    return UserFollowResponse.fromJson(jsonDecode(response?.body)['data']);
  }

  @override
  Future<List<UserPlaylistsResponse>> getAllUserPlaylists(String userId) async {
    try {
      final response =
          await httpClient.get(UserEndpoint.getAllUserPlaylists(userId));

      final data = jsonDecode(response?.body)['data'];

      return data
          .map<UserPlaylistsResponse>(
              (playlists) => UserPlaylistsResponse.fromJson(playlists))
          .toList();
    } catch (e) {
      print("$e");
    }
  }
}
