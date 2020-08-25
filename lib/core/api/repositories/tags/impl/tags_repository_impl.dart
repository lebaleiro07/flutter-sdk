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
  Future<Tag> getTagById(String tagId) async {
    final request = await httpClient.get(TagsEndpoint.getTagById(tagId));
    final response = json.decode(request?.body)['data'];

    return Tag.fromMap(response);
  }

  @override
  Future<List<Post>> getAllPostsByTagId(String tagId) async {
    final request =
        await httpClient.get(TagsEndpoint.getAllPostsByTagId(tagId));

    final response = json.decode(request?.body)['data'];

    final posts = <Post>[];

    for (var item in response) {
      posts.add(Post.fromMap(item));
    }

    return posts;
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
