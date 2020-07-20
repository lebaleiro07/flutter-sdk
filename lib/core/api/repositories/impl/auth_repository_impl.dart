import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/endpoints/auth_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/auth/activity_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/activity_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/auth_credentials.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/forgot_password_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/policy_terms.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signin_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signout_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signup_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signup_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/spotify_login_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/validate_token_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

import '../../endpoints/auth_endpoint.dart';

class AuthRepositoryImpl implements AuthRepository {
  final MusicPlayceHttp httpClient;
  final FlutterSecureStorage flutterSecureStorage;

  AuthRepositoryImpl({
    @required this.httpClient,
    @required this.flutterSecureStorage
  });

  @override
  Future<SignInResponse> signin(AuthCredentials credentials) async{
    final response = await httpClient.post(
      AuthEndpoint.signin,
      body: credentials.toJSON(),
    );

    return SignInResponse.fromJson(jsonDecode(response.body)['jwt']);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async{
    final response = await httpClient.post(
      AuthEndpoint.refresh,
      body: request.toJson(),
    );

    return RefreshTokenResponse.fromJson(jsonDecode(response.body)['jwt']);
  }

  @override
  Future<SignUpResponse> signup(SignUpRequest request) async{
    final response = await httpClient.post(
      AuthEndpoint.signup,
      body: request.toJson(),
    );

    return SignUpResponse.fromJson(json?.decode(response.body)['jwt']);
  }

  @override
  Future<ValidateTokenResponse> validateToken(String token) async{
    final response = await httpClient.get(
      AuthEndpoint.validate(token),
    );

    return ValidateTokenResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> storeToken(RefreshTokenResponse refreshTokenResponse) {
    return flutterSecureStorage.write(key: "token", value: jsonEncode(refreshTokenResponse.toJson()));
  }

  @override
  Future<SignOutResponse> logout(String deviceToken) async{
    final response = await httpClient.get(
      AuthEndpoint.logout(deviceToken),
    );

    return SignOutResponse.fromJson(json?.decode(response.body)['jwt']);
  }

  @override
  Future<Response> reSendEmailConfirmation() async{
    return await httpClient.post(
      AuthEndpoint.resendEmail,
    );
  }

  Future<Response> acceptTerms(PolicyTerms policyTerms) async {
    return await httpClient.post(
      AuthEndpoint.terms,
      body: policyTerms.toJson()
    );
  }

  @override
  Future<Response> forgotPassword(RecoverPasswordRequest request) async{
    return await httpClient.post(AuthEndpoint.recoverPassword, body: request.toJson());
  }

  @override
  Future<ActivityResponse> activityOn() async{
    final response = await httpClient.post(AuthEndpoint.activity);

    return ActivityResponse.fromJson(json?.decode(response.body)['data']);
  }

  @override
  Future<Response> activityOff(ActivityRequest request) {
    return httpClient.delete(AuthEndpoint.activityOff(request.activityId));
  }

  @override
  Future<SignInResponse> spotifyLogin(SpotifyLoginRequest request) async{
    final response = await httpClient.post(
      AuthEndpoint.spotifyLogin,
      body: request.toJson()
    );

    return SignInResponse.fromJson(json?.decode(response.body)['jwt']);
  }
}