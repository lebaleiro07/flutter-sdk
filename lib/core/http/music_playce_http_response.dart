import 'package:http/http.dart';

import '../api/models/base_model.dart';

class MusicPlayceHttpResponse extends Response {
  BaseModel _data;

  MusicPlayceHttpResponse(String body, int statusCode,
      {BaseRequest request,
      Map<String, String> headers = const {},
      bool isRedirect = false,
      bool persistentConnection = true,
      String reasonPhrase})
      : super(body, statusCode,
            headers: headers,
            isRedirect: isRedirect,
            persistentConnection: persistentConnection,
            reasonPhrase: reasonPhrase);

  set data(BaseModel data) => _data = data;

  BaseModel get data => _data;
}
