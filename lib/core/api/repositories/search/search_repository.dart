import 'package:music_playce_sdk/core/api/models/search/search_item.dart';

abstract class SearchRepository {
  Future<List<SearchItem>> search(String query, {int limit = 5});
}
