import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_playce_sdk/core/api/endpoints/auth_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/auth/auth_credentials.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signin_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signout_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signup_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signup_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/validate_token_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class AuthRepositoryImpl implements AuthRepository {
  final MusicPlayceHttp httpClient;
  final FlutterSecureStorage flutterSecureStorage;

  AuthRepositoryImpl({
    @required this.httpClient,
    @required this.flutterSecureStorage
  });

  @override
  Future<SignInResponse> signin(AuthCredentials credentials) async{
    final response = await httpClient.request(
      AuthEndpoint.signin,
      body: credentials.toJSON(),
      method: "POST"
    );

    return SignInResponse.fromJson(jsonDecode(response.body)['jwt']);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async{
    final response = await httpClient.request(
      AuthEndpoint.refresh,
      body: request.toJson(),
      method: "POST",
    );

    return RefreshTokenResponse.fromJson(jsonDecode(response.body)['jwt']);
  }

  @override
  Future<SignUpResponse> signup(SignUpRequest request) async{
    final response = await httpClient.request(
      AuthEndpoint.signup,
      body: request.toJson(),
      method: "POST",
    );

    return SignUpResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ValidateTokenResponse> validateToken(String token) async{
    final response = await httpClient.request(
      AuthEndpoint.validate(token),
      method: "GET"
    );

    return ValidateTokenResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> storeToken(RefreshTokenResponse refreshTokenResponse) {
    return flutterSecureStorage.write(key: "token", value: jsonEncode(refreshTokenResponse.toJson()));
  }

  @override
  Future<SignOutResponse> logout(String deviceToken) async{
    final response = await httpClient.request(
      AuthEndpoint.logout(deviceToken),
      method: "GET",
    );

    return SignOutResponse.fromJson(jsonDecode(response.body)['jwt']);
  }
}