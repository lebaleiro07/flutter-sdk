import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/services/auth_service.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_interceptor_wrapper.dart';
import 'package:rxdart/rxdart.dart';

import '../../http/music_playce_http.dart';

class AuthInterceptor implements MusicPlayceHttpInterceptorWrapper {
  final authRepository = GetIt.instance<AuthRepository>();
  final flutterSecureStorage = GetIt.instance<fss.FlutterSecureStorage>();
  final refreshTokenSubject = GetIt.instance<BehaviorSubject<RefreshTokenResponse>>();
  final authService = GetIt.instance<AuthService>();
  final httpClient = GetIt.instance<MusicPlayceHttp>();

  /// This method is calling whenever a request fails with
  /// with the status of 401 or 406 with the invalid
  /// token message
  ///
  /// It receives a [Response] and a [body] message
  /// it must returns a [Response] type in order to
  /// continue with the request flow
  Future<Response> interceptResponse(Response response, body) async {
    var data;

    try {
      data = jsonDecode(response.body);
    } catch(e) {
      data = {};
    }

    final code = response.statusCode;

    if (code == 406 && data['error']['message'] == "Invalid token" || code == 401) {
      final refreshTokenJson = jsonDecode(await flutterSecureStorage.read(key: "token"));

      final refreshTokenRequest = RefreshTokenRequest.fromJson(refreshTokenJson);

      final isValidRefreshToken = await authService.validateToken(refreshTokenRequest.refreshToken);

      if (isValidRefreshToken) {
        try {
          final headers = Map<String, String>();

          final refreshTokenResponse = await authRepository.refreshToken(refreshTokenRequest);

          headers["authorization"] = "Bearer ${refreshTokenResponse.token}";

          final httpResponse = await httpClient.request(
            response.request.url.toString(),
            method: response.request.method,
            headers: headers,
            body: body
          );

          // add the new token in a stream for notificate the listener
          // that a new token is available
          refreshTokenSubject.add(refreshTokenResponse);

          return httpResponse;
        } catch (e){
          return response;
        }
      }
    }

    return response;
  }
}