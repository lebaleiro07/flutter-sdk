import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../../http/music_playce_http.dart';
import '../../http/music_playce_http_headers.dart';
import '../../http/music_playce_http_interceptor_wrapper.dart';
import '../../utils/string_util.dart';
import '../endpoints/v3/auth_endpoint.dart';
import '../models/auth/refresh_token_request.model.dart';
import '../models/auth/refresh_token_response.model.dart';
import '../repositories/v3/auth/auth_repository.dart';
import '../services/auth_service.dart';

class RefreshTokenInterceptor implements MusicPlayceHttpInterceptorWrapper {
  final authRepository = GetIt.instance<AuthRepository>();
  final flutterSecureStorage = GetIt.instance<fss.FlutterSecureStorage>();
  final refreshTokenSubject =
      GetIt.instance<BehaviorSubject<RefreshTokenResponse>>();
  final authService = GetIt.instance<AuthService>();
  final httpClient = GetIt.instance<MusicPlayceHttp>();
  final mpHeaders = GetIt.instance<MusicPlayceHttpHeaders>();

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
    } catch (e) {
      data = {};
    }

    print(data);

    final code = response.statusCode;

    final path = response.request.url.toString();

    if (path.contains("/auth/validate") ||
        _disallowedRoutes.contains(response.request.url)) return response;

    if (code == 406 && data['error']['message'] == "Invalid token" ||
        code == 401) {
      final storageToken = await flutterSecureStorage.read(key: "token");

      if (storageToken != null) {
        final refreshTokenJson = json?.decode(storageToken);

        final refreshTokenRequest =
            RefreshTokenRequest.fromJson(refreshTokenJson);

        final isValidRefreshToken =
            await authService.validateToken(refreshTokenRequest.refreshToken);

        if (isValidRefreshToken) {
          try {
            final refreshTokenResponse =
                await authRepository.refreshToken(refreshTokenRequest);

            mpHeaders.authorizationHeader = refreshTokenResponse.token;

            final httpResponse = await httpClient.request(response.request.url,
                method: response.request.method, body: body);

            // add the new token in a stream for notificate the listener
            // that a new token is available
            refreshTokenSubject.add(refreshTokenResponse);

            return httpResponse;
          } catch (e) {
            return response;
          }
        }

        return response;
      }

      return response;
    }

    return response;
  }

  List<Uri> _disallowedRoutes = [
    AuthEndpoint.signin.toURI(),
    AuthEndpoint.signup.toURI(),
  ];
}
