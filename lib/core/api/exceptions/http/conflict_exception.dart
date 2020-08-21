import 'music_playce_http_exception.dart';

class ConflictException extends MusicPlayceException {
  final String message;

  const ConflictException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
