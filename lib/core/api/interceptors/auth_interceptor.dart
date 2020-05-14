import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/services/auth_service.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';
import 'package:music_playce_sdk/core/http/impl/music_playce_http_impl.dart';
import 'package:rxdart/rxdart.dart';

class AuthInterceptor {
  final authRepository = GetIt.instance<AuthRepository>();
  final flutterSecureStorage = GetIt.instance<fss.FlutterSecureStorage>();
  final refreshTokenSubject = GetIt.instance<BehaviorSubject<RefreshTokenResponse>>();
  final authService = GetIt.instance<AuthService>();

  Future<Response> onError(Response response, body) async {
    Map<String, dynamic> data = Map<String, dynamic>();

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

          final httpResponse = await MusicPlayceHttpImpl().request(
            response.request.url.toString(),
            method: response.request.method,
            headers: headers,
            body: body
          );

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