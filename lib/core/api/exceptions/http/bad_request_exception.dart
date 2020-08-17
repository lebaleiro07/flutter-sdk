import 'package:music_playce_sdk/core/api/exceptions/http/music_playce_http_exception.dart';

class BadRequestException extends MusicPlayceException {
  final String message;

  const BadRequestException(this.message, { dynamic json }) : super(message,
    json: json
  );

  @override
  String toString() => message;
}