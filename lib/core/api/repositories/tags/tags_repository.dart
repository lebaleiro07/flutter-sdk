import 'package:flutter/foundation.dart';

import '../../../http/music_playce_http_response.dart';
import '../../models/posts/posts.model.dart';
import '../../models/posts/tag.model.dart';

abstract class TagsRepository {
  /// Returns a [List] which contains all [Tag]
  Future<List<Tag>> getAllTags();

  /// Returns a specific [Tag] using it's [tagId], and returns a [Tag] as a response
  Future<Tag> getTagById(String tagId);

  /// Update a specific [Tag], passing a [Tag], and returns a [Tag] as a response
  Future<Tag> updateTag({@required Tag tag});

  /// Delete a specific [Tag], passing a [Tag], and returns a [MusicPlayceHttpResponse]
  /// as a response
  Future<MusicPlayceHttpResponse> deleteTag({@required Tag tag});

  /// Follows a specific [Tag] using it's [tagId], and returns a [Tag] as a response
  Future<Tag> followTag(String tagId);

  /// Unfollows a specific [Tag] using it's [tagId], and returns a [MusicPlayceHttpResponse] as a response
  Future<MusicPlayceHttpResponse> unfollowTag(String tagId);

  /// Returns a [List] which contains all [Post] with the desired [Tag]
  Future<List<Post>> getAllPostByTagId(String tagId);
}
