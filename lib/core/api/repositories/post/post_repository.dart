import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../models/cursor.dart';
import '../../models/posts/indication.model.dart';
import '../../models/posts/like.model.dart';
import '../../models/posts/posts.model.dart';

/// A repository for deal with posts from the api
abstract class PostRepository {
  /// This will return all posts in a [DataWithCursor] format
  Future<Either<Exception, DataWithCursor<Post>>> getAll(
      {int limit = 8, String page, orderBy = "plays"});

  // TODO: put playback moment
  Future<Either<Exception, Indication>> indicate(
      String postId, String indicatedProfileId);

  Future<Either<Exception, Like>> like(String postId);

  Future<Either<Exception, Response>> dislike(String postId);
}
