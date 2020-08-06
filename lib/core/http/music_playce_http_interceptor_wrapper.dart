import 'package:http/http.dart';

/// Abstract class for HTTP Interceptors
abstract class MusicPlayceHttpInterceptorWrapper {
  /// This method is called when the request is reached and the
  /// response is ready
  ///
  /// All interceptors for response needs to return a [Response]
  Future<Response> interceptResponse(Response response, body);
}