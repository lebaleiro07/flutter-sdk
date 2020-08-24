import 'music_playce_http_exception.dart';

class PaymentRequiredException extends MusicPlayceException {
  final String message;

  const PaymentRequiredException(this.message, {dynamic json})
      : super(message, json: json);

  @override
  String toString() => message;
}
