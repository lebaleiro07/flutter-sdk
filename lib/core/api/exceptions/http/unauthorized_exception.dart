import 'music_playce_http_exception.dart';

class UnauthorizedException extends MusicPlayceException {
  final String message;

  const UnauthorizedException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
