import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/models/users/user_update_request.dart';

import '../../../http/music_playce_http.dart';
import '../../models/users/user_update_response.model.dart';
import '../../endpoints/search_endpoint.dart';
import '../../endpoints/user_endpoint.dart';
import '../../models/cursor.dart';
import '../../models/users/term.dart';
import '../../models/users/user_follow_response.model.dart';
import '../../models/users/user_likes_response.model.dart';
import '../../models/users/user_playlists_response.model.dart';
import '../../models/users/user_response.model.dart';
import '../users_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final MusicPlayceHttp httpClient;

  UserRepositoryImpl({
    @required this.httpClient
  });

  @override
  Future<User> getUser(String userId) async {
    final response = await httpClient.get(
      UserEndpoint.getUser(userId),
    );

    return User.fromMap(jsonDecode(response?.body));
  }

  @override
  Future<UserUpdateResponse> updateUser(UserUpdateRequest userUpdateRequest, String userId) async {
    final response = await httpClient.put(
      UserEndpoint.updateUser(userId),
      body: {
        "name": userUpdateRequest.name,
        "description": userUpdateRequest.description,
        "location": userUpdateRequest.location,
        "phone": userUpdateRequest.phone,
        "id_picture_cover": userUpdateRequest.idPictureCover,
        "id_picture_profile":userUpdateRequest.idPictureProfile,
      }
    );

    return UserUpdateResponse.fromMap(jsonDecode(response?.body)['data']);
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
  Future<DataWithCursor<UserPlaylists>> getAllUserPlaylists({ String userId, String page, int limit = 12 }) async{
    try {
      final response = await httpClient.get(
          "${UserEndpoint.getAllUserPlaylists(userId)}?limit=$limit" + (page != null ? "&page=$page" : "")

      );

      final data = jsonDecode(response.body);

      final list = data['data']
          .map<UserPlaylists>((playlist) => UserPlaylists.fromMap(playlist))
          .toList();

      final cursor = jsonDecode(response?.body)['cursor'];

      return DataWithCursor<UserPlaylists>(
        cursor: Cursor.fromMap(cursor),
        data: list
      );
    } catch (e, s) {
      print("$e $s");
    }
  }

  @override
  Future<Either<Exception, List<User>>> search(String query, { int limit = 5 }) async {
    try {
      final response = await httpClient.get(
        "${UserEndpoint.getAllUsersByName(query)}?limit=$limit"
      );

      final json = jsonDecode(response?.body)['data'];

      final users = json.map<User>((user) => User.fromMap(user))
        .toList();

      return right(users);
    } catch(e) {
      print(e);
      return left(e);
    }
  }

  @override
  Future<Either<Exception, dynamic>> checkEmail(String email) async{
    try {
      final response = await httpClient.post(UserEndpoint.checkEmail, body: {
        "email": email
      });

      final data = jsonDecode(response?.body)['data'];

      return right(data);
    } catch(e, s) {
      print("$e $s");
      return left(e);
    }
  }
  
  @override
  Future<Either<Exception, dynamic>> checkPhone(String phone) async{
    try {
      final response = await httpClient.post(UserEndpoint.checkPhone, body: {
        "phone": phone
      });

      final data = jsonDecode(response?.body)['data'];

      return right(data);
    } catch(e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Term>> getTerm(String name) async {
    try {
      final response = await httpClient.get(UserEndpoint.getTerm(name));

      final data = jsonDecode(response?.body)['data'];

      final term = Term.fromJson(data);

      return right(term);
    } catch(e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Term>>> getAllTerms() async {
    final List<Term> terms = [];

    final endUserAgreement = await getTerm('end-user-agreement');

    endUserAgreement.fold(
      (err) => left(err),
      (success) => terms.add(success)
    );

    final privacyPolicy = await getTerm('privacy-policy');

    privacyPolicy.fold(
      (err) => left(err),
      (success) => terms.add(success)
    );

    return right(terms);
  }
}
