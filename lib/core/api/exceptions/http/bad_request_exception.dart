import 'music_playce_http_exception.dart';

class BadRequestException extends MusicPlayceException {
  final String message;

  const BadRequestException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
