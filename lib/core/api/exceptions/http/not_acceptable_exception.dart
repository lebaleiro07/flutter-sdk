import 'music_playce_http_exception.dart';

class NotAcceptableException extends MusicPlayceException {
  final String message;

  const NotAcceptableException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}