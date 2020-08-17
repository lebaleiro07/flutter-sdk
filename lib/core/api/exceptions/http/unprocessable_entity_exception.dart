import 'package:music_playce_sdk/core/api/exceptions/http/music_playce_http_exception.dart';

class UnprocessableEntityException extends MusicPlayceException {
  final String message;

  const UnprocessableEntityException(this.message, { dynamic json }) : super(message,
    json: json
  );

  @override
  String toString() => message;
}