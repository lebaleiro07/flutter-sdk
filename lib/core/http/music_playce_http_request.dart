import 'dart:convert';

import 'package:http/http.dart';

import 'package:http_parser/http_parser.dart';

class MusicPlayceHttpRequest extends Request {
  MusicPlayceHttpRequest(String method, Uri url) : super(method, url);

  @override
  set bodyFields(Map<String, String> fields) {
    var contentType = _contentType;
    if (contentType == null) {
      _contentType = MediaType('application', 'x-www-form-urlencoded');
    } else if (contentType.mimeType != 'application/x-www-form-urlencoded') {
      throw StateError('Cannot set the body fields of a Request with '
          'content-type "${contentType.mimeType}".');
    }

    body = _mapToQuery(fields, encoding: encoding);
  }

  /// The `Content-Type` header of the request (if it exists) as a [MediaType].
  MediaType get _contentType {
    var contentType = headers['content-type'];
    if (contentType == null) return null;
    return MediaType.parse(contentType);
  }

  set _contentType(MediaType value) {
    headers['content-type'] = value.toString();
  }

  String _mapToQuery(Map<String, String> map, {Encoding encoding}) {
    var pairs = <List<String>>[];

    map.forEach((key, value) {
      if (value != null) {
        pairs.add([
          Uri.encodeQueryComponent(key, encoding: encoding),
          Uri.encodeQueryComponent(value, encoding: encoding)
        ]);
      }
    });

    return pairs.map((pair) => '${pair[0]}=${pair[1]}').join('&');
  }
}