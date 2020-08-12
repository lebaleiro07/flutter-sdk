import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/endpoints/post_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:music_playce_sdk/core/api/models/posts/indication.model.dart';
import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';
import 'package:music_playce_sdk/core/api/repositories/post/post_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class PostRepositoryImpl implements PostRepository {
  /// This is the http client used to request the api
  final MusicPlayceHttp _httpClient;

  const PostRepositoryImpl(this._httpClient);

  @override
  Future<Either<Exception, DataWithCursor<Post>>> getAll({ int limit = 8, String page, orderBy = "plays" }) async{
    try {
      final result = await _httpClient.get(
        "${PostEndpoint.getAll}?limit=$limit&sort=$orderBy" + (page != null ? "&next=$page" : "")
      );
      
      final data = jsonDecode(result.body);

      final posts = data['data']
        .map<Post>((post) => Post.fromMap(post))
        .toList();

      final cursor = Cursor.fromMap(data['cursor']);

      return right(
        DataWithCursor<Post>(
          cursor: cursor,
          data: posts
        )
      );
    } catch(e, s){
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Indication>> indicate(String postId, String indicatedProfileId) async {
    try {
      final response = await _httpClient.post(PostEndpoint.indicate(postId), body: {
        "id_profile_to": indicatedProfileId
      });

      final json = jsonDecode(response?.body)['data'];

      return right(Indication?.fromJson(json));
    } catch(e) {
      return left(e);
    }
  }
}