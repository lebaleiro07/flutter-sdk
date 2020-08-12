import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/endpoints/search_endpoint.dart';
import 'package:music_playce_sdk/core/api/repositories/search/search_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class SearchRepositoryImpl implements SearchRepository {
  final MusicPlayceHttp _httpClient;

  const SearchRepositoryImpl(this._httpClient);

  @override
  Future<Either<Exception, Map>> search(String query, { int limit = 5 }) async {
    try {
      final response = await _httpClient.get(
        "${SearchEndpoint.search}?query=$query&limit=$limit"
      );

      final json = jsonDecode(response?.body)['data'];

      return json['data'];
    } catch(e) {
      return right(e);
    }
  }
}