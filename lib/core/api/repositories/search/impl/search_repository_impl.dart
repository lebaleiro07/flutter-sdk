import 'dart:convert';

import '../../../../http/music_playce_http.dart';
import '../../../endpoints/search_endpoint.dart';
import '../../../models/search/search_item.dart';
import '../search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final MusicPlayceHttp _httpClient;

  const SearchRepositoryImpl(this._httpClient);

  @override
  Future<List<SearchItem>> search(String query, {int limit = 5}) async {
    final request = await _httpClient
        .get("${SearchEndpoint.search}?query=$query&limit=$limit");

    final response = json.decode(request?.body)['data'];

    final searchItems = <SearchItem>[];

    for (var item in response) {
      searchItems.add(SearchItem.fromMap(item));
    }

    return searchItems;
  }
}
