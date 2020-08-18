import 'package:music_playce_sdk/core/api/exceptions/http/music_playce_http_exception.dart';

class UnknownErrorException extends MusicPlayceException {
  final String message;

  const UnknownErrorException(this.message, { dynamic json }) : super(message,
    json: json
  );

  @override
  String toString() => message;
}