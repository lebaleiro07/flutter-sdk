import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/exceptions/http/bad_request_exception.dart';
import 'package:music_playce_sdk/core/api/exceptions/http_exceptions.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_headers.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_interceptor.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_interceptor_wrapper.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_request.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_status.dart';

class MusicPlayceHttpImpl extends MusicPlayceHttpInterceptor implements BaseClient, MusicPlayceHttp {
  final _client = Client();
  final List<MusicPlayceHttpInterceptorWrapper> _interceptors = [];
  final _mpHeaders = GetIt.instance<MusicPlayceHttpHeaders>();
  int _lastStatusCode;
  Response _lastResponseData;

  Future<Response> request(url, { String method, Map<String, String> headers, body, Encoding encoding }) async{
    try {
      Response response;

      var finalHeader = Map<String, String>();

      if (headers != null) finalHeader = headers;

      finalHeader = {
        ...finalHeader,
        ..._mpHeaders.headers
      };

      if (method == "GET") response = await _sendUnstreamed("GET", url, finalHeader);
      else if (method == "POST") response = await _sendUnstreamed("POST", url, finalHeader, body, encoding);
      else if (method == "PUT") response = await _sendUnstreamed("PUT", url, finalHeader, body, encoding);
      else if (method == "DELETE") response = await _sendUnstreamed("DELETE", url, finalHeader);
      else if (method == "PATH") response = await _sendUnstreamed("PATCH", url, finalHeader, body, encoding);
      else if (method == "HEAD") response = await _sendUnstreamed("HEAD", url, finalHeader);

      if (_interceptors.isNotEmpty) {
        response = await interceptResponse(_interceptors, response, body);
      }

      lastStatusCode = response.statusCode;

      if (lastStatusCode == MusicPlayceHttpStatus.badRequest) {
        throw BadRequestException(HttpExceptionCodes.badRequest, json: jsonDecode(response?.body));
      } else if (lastStatusCode == MusicPlayceHttpStatus.clientError
       || lastStatusCode == MusicPlayceHttpStatus.unauthorized){
         throw UnauthorizedException(HttpExceptionCodes.unauthorized, json: jsonDecode(response?.body));
       }
      else if (lastStatusCode == MusicPlayceHttpStatus.paymentRequired){
        throw PaymentRequiredException(HttpExceptionCodes.paymentRequired, json: jsonDecode(response?.body));
      }
      else if (lastStatusCode == MusicPlayceHttpStatus.forbidden){
        throw ForbiddenException(HttpExceptionCodes.forbidden, json: jsonDecode(response?.body));
      }
      else if (lastStatusCode == MusicPlayceHttpStatus.notFound){
        throw NotFoundException(HttpExceptionCodes.notFound, json: jsonDecode(response?.body));
      }
      else if (lastStatusCode == MusicPlayceHttpStatus.conflict){
        throw ConflictException(HttpExceptionCodes.conflict, json: jsonDecode(response?.body));
      }
      else if (lastStatusCode == MusicPlayceHttpStatus.tooManyRequest){
        throw TooManyRequestsException(HttpExceptionCodes.tooManyRequest, json: jsonDecode(response?.body));
      }
      else if (lastStatusCode == MusicPlayceHttpStatus.unknownError){
        throw UnknownErrorException(HttpExceptionCodes.unknownError, json: jsonDecode(response?.body));
      } else if (lastStatusCode == MusicPlayceHttpStatus.unprocessableEntity) {
        throw UnprocessableEntityException(HttpExceptionCodes.unprocessableEntity, json: jsonDecode(response?.body));
      }

      print("calling endpoint $url with ${_interceptors.length} interceptors");

      lastResponseData = response;

      return response;
    } on TimeoutException catch(e, s){
      return Response(jsonEncode({ "data": "timeout exception" }), 408);
    } catch(e, s){
      print(e);
      print(s);
      throw e;
    }
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) async{
    try {
      return request(url, method: "DELETE", headers: headers);
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
      return request(url, method: "PATCH", body: body, headers: headers, encoding: encoding);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    try {
      return request(url, method: "POST", body: body, headers: headers, encoding: encoding);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    try {
      return request(url, method: "PUT", body: body, encoding: encoding);
    } catch(e){
      throw e;
    }
  }

  @override
  Future<String> read(url, {Map<String, String> headers}) {
    return _client.read(url, headers: headers);
  }

  @override
  Future<Uint8List> readBytes(url, {Map<String, String> headers}) {
    return _client.readBytes(url, headers: headers);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _client.send(request);
  }

  /// Sends a non-streaming [Request] and returns a non-streaming [Response].
  Future<Response> _sendUnstreamed(String method, url, Map<String, dynamic> headers, [body, Encoding encoding]) async {
    var request = MusicPlayceHttpRequest(method, _uriFromString(url));

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;

    if (body != null) {
      if (body is String) request.body = body;
      else if (body is List) request.bodyBytes = body.cast<int>();
      else if (body is Map) request.bodyFields = body.cast<String, dynamic>();
      else throw ArgumentError('Invalid request body "$body".');
    }

    return Response.fromStream(await send(request)
      .timeout(Duration(seconds: 20)));
  }

  /// Converts a string [uri] to a [Uri]
  Uri _uriFromString(uri) => uri is String ? Uri.parse(uri) : uri as Uri;

  set lastResponseData(Response response) {
    _lastResponseData = response;
  }

  Response get lastResponseData => _lastResponseData;

  set lastStatusCode(int statusCode) {
    _lastStatusCode = statusCode;
  }

  int get lastStatusCode => _lastStatusCode;

  /// Getter for interceptors
  List<MusicPlayceHttpInterceptorWrapper> get interceptors => _interceptors;

  @override
  void close() {
    close();
  }
}