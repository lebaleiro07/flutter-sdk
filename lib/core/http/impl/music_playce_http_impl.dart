import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/interceptors/auth_interceptor.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class MusicPlayceHttpImpl implements BaseClient, MusicPlayceHttp  {
  final client = Client();
  int _lastStatusCode;

  @override
  Future<Response> request(String url, { String method, Map<String, dynamic> body, Map<String, String> headers }) async{
    try {
      Response response;

      if (method == "GET") response = await client.get(url, headers: headers);
      else if (method == "POST") response = await client.post(url, body: body, headers: headers);
      else if (method == "PUT") response = await client.put(url, body: body,headers: headers);
      else if (method == "DELETE") response = await client.delete(url, headers: headers);
      else if (method == "PATH") response = await client.patch(url, body: body, headers: headers);
      else if (method == "HEAD") response = await client.head(url, headers: headers);

      if (response.statusCode == 401) {
        response = await AuthInterceptor().onError(response, body);
      }

      lastStatusCode = response.statusCode;

      print("Calling endpoint $url");

      return response;
    } catch(e, s){
      print(s);
      throw e;
    }
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) async{
    try {
      return client.delete(url, headers: headers);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    try {
      return request(url, method: "GET", headers: headers);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    try {
      return request(url, method: "HEAD", headers: headers);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) {
    try {
      return request(url, method: "PATCH", body: body, headers: headers);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    try {
      return request(url, method: "POST", body: body, headers: headers);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    try {
      return request(url, method: "PUT", body: body);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<String> read(url, {Map<String, String> headers}) {
    return client.read(url, headers: headers);
  }

  @override
  Future<Uint8List> readBytes(url, {Map<String, String> headers}) {
    return client.readBytes(url, headers: headers);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return client.send(request);
  }

  @override
  void close() {
    close();
  }

  set lastStatusCode(int statusCode) {
    _lastStatusCode = statusCode;
  }

  int get lastStatusCode => _lastStatusCode;
}