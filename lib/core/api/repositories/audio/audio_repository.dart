import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';

abstract class AudioRepository {
  Future<Either<Exception, DataWithCursor<Post>>> getPost(String page);

  Future<Either<Exception, DataWithCursor<Post>>> getPostFromPlaylist(String playlistId, { String page, int limit });
}