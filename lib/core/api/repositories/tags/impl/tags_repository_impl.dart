import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:music_playce_sdk/core/api/endpoints/tags_endpoint.dart';

import '../../../../http/music_playce_http.dart';
import '../../../../http/music_playce_http_response.dart';
import '../../../models/posts/posts.model.dart';
import '../../../models/posts/tag.model.dart';
import '../tags_repository.dart';

class TagsRepositoryImpl implements TagsRepository {
  final MusicPlayceHttp httpClient;

  TagsRepositoryImpl({@required this.httpClient});

  @override
  Future<List<Tag>> getAllTags() async {
    final request = await httpClient.get(TagsEndpoint.getAllTags);

    final response = json.decode(request?.body)['data'];

    final tags = <Tag>[];

    for (var item in response) {
      tags.add(Tag.fromMap(item));
    }

    return tags;
  }

  @override
  Future<MusicPlayceHttpResponse> deleteTag({Tag tag}) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<Tag> followTag(String tagId) {
    // TODO: implement followTag
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAllPostByTagId(String tagId) {
    // TODO: implement getAllPostByTagId
    throw UnimplementedError();
  }

  @override
  Future<Tag> getTagById(String tagId) {
    // TODO: implement getTagById
    throw UnimplementedError();
  }

  @override
  Future<MusicPlayceHttpResponse> unfollowTag(String tagId) {
    // TODO: implement unfollowTag
    throw UnimplementedError();
  }

  @override
  Future<Tag> updateTag({Tag tag}) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }
}
