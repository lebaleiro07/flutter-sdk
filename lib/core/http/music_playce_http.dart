import 'dart:convert';

import 'package:http/http.dart';

abstract class MusicPlayceHttp {
  /// Sends an HTTP request to the given url, to the given method with the given
  /// body and headers.
  ///
  /// The [url] can be a [String] or a [Uri], the [method] is
  /// a [String] like GET, POST, PUT etc.. The [body] can be a Map, a String or
  /// a List. The [header] must be a Map.
  /// It returns a [Response] containing the data and also the request data
  Future<Response> request(url,
      {body, String method, Map<String, String> headers});

  Future<Response> get(url, {Map<String, String> headers});

  Future<Response> post(url,
      {body, Map<String, String> headers, Encoding encoding});

  Future<Response> put(url,
      {body, Map<String, String> headers, Encoding encoding});

  Future<Response> delete(url, {Map<String, String> headers});

  Future<Response> patch(url,
      {body, Map<String, String> headers, Encoding encoding});

  Future<Response> head(url, {Map<String, String> headers});
}
