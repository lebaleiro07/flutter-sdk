import 'music_playce_http_exception.dart';

class TooManyRequestsException extends MusicPlayceException {
  final String message;

  const TooManyRequestsException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
