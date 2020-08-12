import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:music_playce_sdk/core/api/models/posts/indication.model.dart';
import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';

/// A repository for deal with posts from the api
abstract class PostRepository {
  /// This will return all posts in a [DataWithCursor] format
  Future<Either<Exception, DataWithCursor<Post>>> getAll({ int limit = 8, String page, orderBy = "plays" });

  // TODO: put playback moment
  Future<Either<Exception, Indication>> indicate(String postId, String indicatedProfileId);
}