import 'package:http/http.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_interceptor_wrapper.dart';


abstract class MusicPlayceHttpInterceptor {
  /// Loops through the interceptors, executing the
  /// callbacks
  ///
  /// It returns a response after all the interceptors execution
  Future<Response> interceptResponse(List<MusicPlayceHttpInterceptorWrapper> interceptors, Response response, body) async{
    Response finalResponse;

    for (MusicPlayceHttpInterceptorWrapper interceptor in interceptors) {
      finalResponse = await interceptor.interceptResponse(response, body);
    }

    return finalResponse;
  }
}