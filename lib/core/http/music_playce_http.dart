import 'package:http/http.dart';

abstract class MusicPlayceHttp {
  //Sends a request with the given url, method, body and headers and
  //returns a response with the request info
  Future<Response> request(String url, { String method, Map<String, dynamic> body, Map<String, String> headers });
}