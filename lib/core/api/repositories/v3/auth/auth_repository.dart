import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/models/auth/auth_credentials.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signin_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/v3/signup_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/v3/signup_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/validate_token_response.model.dart';

abstract class AuthRepository {
  Future<Either<Exception, SignInResponse>> login(AuthCredentials credentials);

  Future<Either<Exception, SignUpResponse>> register(SignUpRequest signUpRequest);

  /// Sends an HTTP request to the refresh token endpoint with the
  /// [RefreshTokenRequest] in order to get a new access token
  ///
  /// The request is made to [AuthEndpoint.refresh] and the
  /// response is a [RefreshTokenResponse] with the new given
  /// token
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest token);

  /// Sends an HTTP request to the validate token endpoint with
  /// the [token] for validate him
  ///
  /// The request is made to [AuthEndpoint.validate] and the
  /// response is a [ValidateTokenResponse]
  Future<ValidateTokenResponse> validateToken(String token);

  Future<void> storeToken(RefreshTokenResponse refreshTokenResponse);

  // Future<Either<Exception, dynamic>> checkUsername(String username);

  Future<Either<Exception, dynamic>> confirm(String code);

  Future<Either<Exception, dynamic>> resendConfirmation(String email);

  Future<Either<Exception, dynamic>> forgotPassword(String email);

  Future<Either<Exception, dynamic>> resetPassword(String code, String password);
}