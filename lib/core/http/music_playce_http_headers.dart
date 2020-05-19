/// A class that serves as central, for all the headers
/// that MusicPlayce routes needs
class MusicPlayceHttpHeaders {
  final Map<String, String> _headers = {
    "authorization": null
  };

  set authorizationHeader(String token) {
    _headers['authorization'] = "Bearer $token";
  }

  Map<String, String> get headers => _headers;
}