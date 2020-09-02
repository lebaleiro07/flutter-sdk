import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/exceptions/http/music_playce_http_exception.dart';
import 'package:music_playce_sdk/core/api/models/poll/poll_create_response.dart';
import 'package:music_playce_sdk/core/api/models/poll/poll_question.dart';

abstract class PollRepository {
  Future<Either<MusicPlayceException, PollCreateResponse>> create(PollQuestion pollQuestion);
}