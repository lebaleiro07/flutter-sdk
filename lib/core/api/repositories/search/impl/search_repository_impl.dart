import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../http/music_playce_http.dart';
import '../../../endpoints/search_endpoint.dart';
import '../search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final MusicPlayceHttp _httpClient;

  const SearchRepositoryImpl(this._httpClient);

  @override
  Future<Either<Exception, Map>> search(String query, {int limit = 5}) async {
    try {
      final response = await _httpClient
          .get("${SearchEndpoint.search}?query=$query&limit=$limit");

      final json = jsonDecode(response?.body)['data'];

      return json['data'];
    } catch (e) {
      return right(e);
    }
  }
}
