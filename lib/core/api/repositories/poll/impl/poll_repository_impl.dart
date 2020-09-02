import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/endpoints/poll_endpoint.dart';
import 'package:music_playce_sdk/core/api/exceptions/http/music_playce_http_exception.dart';
import 'package:music_playce_sdk/core/api/models/poll/poll_create_response.dart';
import 'package:music_playce_sdk/core/api/models/poll/poll_question.dart';
import 'package:http/src/response.dart';
import 'package:music_playce_sdk/core/api/repositories/poll/poll_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class PollRepositoryImpl implements PollRepository {
  final MusicPlayceHttp _httpClient;

  const PollRepositoryImpl(
    this._httpClient
  );

  @override
  Future<Either<MusicPlayceException, PollCreateResponse>> create(
    PollQuestion pollQuestion
  ) async {
    try {
      final response = await _httpClient.post(
        PollEndpoint.create,
        body: pollQuestion.toJson()
      );

      final data = jsonDecode(response?.body)['data'];

      return right(PollCreateResponse.fromJson(data));
    } catch(e, s) {
      print(s);
      return left(e);
    }
  }
}