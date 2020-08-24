import 'music_playce_http_exception.dart';

class ForbiddenException extends MusicPlayceException {
  final String message;

  const ForbiddenException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
