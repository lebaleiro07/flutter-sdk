import 'music_playce_http_exception.dart';

class UnknownErrorException extends MusicPlayceException {
  final String message;

  const UnknownErrorException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
