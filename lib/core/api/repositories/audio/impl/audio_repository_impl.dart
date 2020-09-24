import 'dart:convert';

import 'package:music_playce_sdk/core/api/endpoints/playlist_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/repositories/audio/audio_repository.dart';
import 'package:music_playce_sdk/core/api/repositories/playlists_repository.dart';
import 'package:music_playce_sdk/core/api/repositories/post/post_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class AudioRepositoryImpl implements AudioRepository {
  final PostRepository postRepository;
  final MusicPlayceHttp httpClient;

  const AudioRepositoryImpl({
    this.postRepository,
    this.httpClient
  });

  @override
  Future<Either<Exception, DataWithCursor<Post>>> getPost(String page) async {
    return postRepository.getAll(limit: 1, page: page);
  } 
  
  @override
  Future<Either<Exception, DataWithCursor<Post>>> getPostFromPlaylist(String playlistId, { String page, int limit = 1 }) async {
    try {
      final result = await httpClient.get(
          "${PlaylistEndpoint.getAPlaylist(playlistId)}?limit=$limit" +
              (page != null ? "&next=$page" : ""));

      final data = jsonDecode(result.body);

      final posts = Post.fromMap(data['data']['posts'][0]);

      final cursor = Cursor.fromMap(data['cursor']);

      return right(DataWithCursor<Post>(cursor: cursor, data: [posts]));
    } catch(e) {
      print('ihii $e');
      return left(e);
    }
  }
  
}