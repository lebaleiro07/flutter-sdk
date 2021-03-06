import 'package:http/http.dart';

import '../http/music_playce_http_response.dart';

extension HttpUtils on Response {
  MusicPlayceHttpResponse toMPResponse() {
    return MusicPlayceHttpResponse(this.body, this.statusCode,
        headers: this.headers,
        isRedirect: this.isRedirect,
        request: this.request,
        reasonPhrase: this.reasonPhrase,
        persistentConnection: this.persistentConnection);
  }
}
