import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/search/search_playlist_response.dart';

import '../posts/posts.model.dart';
import '../posts/tag.model.dart';
import '../users/user_response.model.dart';

class SearchItem {
  final String type;
  final dynamic response;

  SearchItem({
    this.type,
    this.response,
  });

  factory SearchItem.fromJson(String str) =>
      SearchItem.fromMap(json.decode(str));

  factory SearchItem.fromMap(Map<String, dynamic> data) {
    final String type = data['type'];

    switch (type) {
      case 'USER':
        return SearchItem(
          type: data['type'] ?? 'USER',
          response: User?.fromMap(data) ?? null,
        );
      case 'TAG':
        return SearchItem(
          type: data['type'] ?? 'TAG',
          response: Tag?.fromMap(data) ?? null,
        );
      case 'POST':
        return SearchItem(
          type: data['type'] ?? 'POST',
          response: Post?.fromMap(data) ?? null,
        );
      case 'PLAYLIST':
        return SearchItem(
          type: data['type'] ?? 'PLAYLIST',
          response: SearchPlaylistResponse?.fromMap(data) ?? null,
        );
      default:
        return null;
    }
  }
}
