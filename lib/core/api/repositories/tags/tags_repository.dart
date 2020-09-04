import 'package:flutter/foundation.dart';
import 'package:music_playce_sdk/core/api/endpoints/tags_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/posts/create_tag_response.dart';

import '../../../http/music_playce_http_response.dart';
import '../../models/posts/posts.model.dart';
import '../../models/posts/tag.model.dart';

abstract class TagsRepository {
  /// Returns a [List] which contains all [Tag]
  Future<List<Tag>> getAllTags({ int limit = 12 });

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
  Future<List<Post>> getAllPostsByTagId(String tagId);

  /// Sends an HTTP request to the tags endpoint in order to
  /// create a tag
  ///
  /// The request is made to [TagsEndpoint.createTag]
  /// It receive a [Tag] object
  ///
  /// It returns a [CreateTagResponse] object
  Future<CreateTagResponse> createTag(Tag tag);

  /// Returns a [List] which contains all [Tags] found searching by the tag
  /// name
  Future<List<Tag>> searchATagByName(String tagName, {int limit = 5});
}