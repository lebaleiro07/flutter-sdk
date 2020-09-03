import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import 'package:music_playce_sdk/core/api/models/posts/create_post_request.dart';
import 'package:music_playce_sdk/core/api/models/posts/post_created_updated_response.dart';
import 'package:music_playce_sdk/core/api/models/posts/update_post_request.dart';

import '../../../../http/music_playce_http.dart';
import '../../../endpoints/post_endpoint.dart';
import '../../../models/cursor.dart';
import '../../../models/posts/indication.model.dart';
import '../../../models/posts/like.model.dart';
import '../../../models/posts/posts.model.dart';
import '../post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  /// This is the http client used to request the api
  final MusicPlayceHttp _httpClient;

  const PostRepositoryImpl(this._httpClient);

  @override
  Future<Either<Exception, DataWithCursor<Post>>> getAll(
      {int limit = 8, String page, orderBy = "plays"}) async {
    try {
      final result = await _httpClient.get(
          "${PostEndpoint.getAll}?limit=$limit&sort=$orderBy" +
              (page != null ? "&next=$page" : ""));

      final data = jsonDecode(result.body);

      final posts =
          data['data'].map<Post>((post) => Post.fromMap(post)).toList();

      final cursor = Cursor.fromMap(data['cursor']);

      return right(DataWithCursor<Post>(cursor: cursor, data: posts));
    } catch (e, s) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Indication>> indicate(
      String postId, String indicatedProfileId) async {
    try {
      final response = await _httpClient.post(PostEndpoint.indicate(postId),
          body: {"id_profile_to": indicatedProfileId});

      final json = jsonDecode(response?.body)['data'];

      return right(Indication?.fromJson(json));
    } catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Like>> like(String postId) async {
    try {
      final response = await _httpClient.post(PostEndpoint.like(postId));
      final body = jsonDecode(response?.body)['data'];

      if (body == null) {
        return null;
      }

      return right(Like.fromMap(body));
    } catch (e) {
      print(e);
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Response>> dislike(String postId) async {
    try {
      final response = await _httpClient.delete(PostEndpoint.like(postId));

      return right(response);
    } catch (e) {
      return left(e);
    }
  }

  @override
  Future<PostCreateUpdatedResponse> createPost(CreatePostRequest createPostRequest) async {
    final response = await _httpClient.post(
        PostEndpoint.createPost,
        body: createPostRequest.toJson(),
    );

    return PostCreateUpdatedResponse.fromMap(jsonDecode(response?.body)['data']);
  }

  @override
  Future<PostCreateUpdatedResponse> updatePost(UpdatePostRequest updatePostRequest) async {
    final response = await _httpClient.put(
      PostEndpoint.updatePost,
      body: updatePostRequest.toJson(),
    );

    return PostCreateUpdatedResponse.fromMap(jsonDecode(response?.body)['data']);
  }



}
