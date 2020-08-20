import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../http/music_playce_http.dart';
import '../../../endpoints/v3/auth_endpoint.dart';
import '../../../models/auth/auth_credentials.model.dart';
import '../../../models/auth/refresh_token_request.model.dart';
import '../../../models/auth/refresh_token_response.model.dart';
import '../../../models/auth/signin_response.model.dart';
import '../../../models/auth/v3/signup_request.model.dart';
import '../../../models/auth/v3/signup_response.model.dart';
import '../../../models/auth/validate_token_response.model.dart';
import 'auth_repository.dart';

class AuthRepositoryV3 implements AuthRepository {
  final MusicPlayceHttp _httpClient;
  final FlutterSecureStorage secureStorage;

  const AuthRepositoryV3(this._httpClient, {@required this.secureStorage});

  @override
  Future<Either<Exception, SignInResponse>> login(
      AuthCredentials credentials) async {
    try {
      final response = await _httpClient.post(AuthEndpoint.signin,
          body: credentials.toJSON());

      final json = jsonDecode(response?.body);

      final data = json['jwt'];

      return right(SignInResponse.fromJson(data));
    } catch (e) {
      print(e);
      return left(e);
    }
  }

  @override
  Future<Either<Exception, SignUpResponse>> register(
      SignUpRequest signUpRequest) async {
    try {
      final response = await _httpClient.post(AuthEndpoint.signup,
          body: signUpRequest.toJson());

      final json = jsonDecode(response?.body);

      final data = json['data']['user'];

      final user = SignUpResponse.fromJson(data);

      return right(user);
    } catch (e, s) {
      print("$e $s");
      return left(e);
    }
  }

  @override
  Future<Either<Exception, dynamic>> confirm(String code) async {
    try {
      final response = await _httpClient.get(AuthEndpoint.confirm(code));

      final data = jsonDecode(response?.body)['data'];

      return Right(data);
    } catch (e) {
      print(e);
      return Left(e);
    }
  }

  @override
  Future<ValidateTokenResponse> validateToken(String token) async {
    final response = await _httpClient.get(
      AuthEndpoint.validate(token),
    );

    return ValidateTokenResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async {
    final response = await _httpClient.post(
      AuthEndpoint.refresh,
      body: request.toJson(),
    );

    return RefreshTokenResponse.fromJson(jsonDecode(response.body)['jwt']);
  }

  @override
  Future<void> storeToken(RefreshTokenResponse refreshTokenResponse) {
    return secureStorage.write(
        key: "token", value: jsonEncode(refreshTokenResponse.toJson()));
  }

  @override
  Future<Either<Exception, dynamic>> resendConfirmation(String email) async {
    try {
      final response = await _httpClient
          .post(AuthEndpoint.resendConfirmation, body: {"email": email});

      final data = jsonDecode(response?.body)['data'];

      return right(data);
    } catch (e) {
      return left(e);
    }
  }
}
