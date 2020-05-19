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

import '../endpoints/auth_endpoint.dart';

/// The abstract class for AuthRepository
///
/// The subclasses need to implement his methods
/// in order to communicate with the auth endpoints
abstract class AuthRepository {
  /// Sends an HTTP request to the auth endpoint in order to
  /// authenticate the user with [AuthCredentials]
  ///
  /// The request is made to [AuthEndpoint.signin] and the
  /// response is a [SignInResponse] with the token
  /// credentials info
  Future<SignInResponse> signin(AuthCredentials credentials);

  /// Sends an HTTP request to the signup endpoint with the
  /// [SignUpRequest] in order to store the user
  ///
  /// The request is made to [AuthEndpoint.signup] and
  /// the response is a [SignUpResponse] with the
  /// token credentials info
  Future<SignUpResponse> signup(SignUpRequest request);

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

  /// Sends an HTTP request to the signout endpoint with
  /// the [token] for invalidate him
  ///
  /// The request is made to [AuthEndpoint.logout] and the
  /// response is a [SignOutResponse]
  Future<SignOutResponse> logout(String token);

  /// Sends an HTTP request to the verify endpoint
  ///
  /// The request is made to [AuthEndpoint.resendEmail] and the
  /// response is an [Response]
  Future<Response> reSendEmailConfirmation();

  /// Sends an HTTP request to verify if the terms where accept
  ///
  /// The request is made to [AuthEndpoint.terms] and the
  /// response is an [Response]
  Future<Response> acceptTerms(PolicyTerms policyTerms);

  /// Sends an HTTP request to recover user password
  ///
  /// The request is made to [AuthEndpoint.terms] with the
  /// [email] of the user and the response is an [Response]
  Future<Response> forgotPassword(RecoverPasswordRequest request);

  /// Sends an HTTP request to start user activity
  ///
  /// the request is made to [AuthEndpoint.activity] and
  /// the response is a [ActivityResponse]
  Future<ActivityResponse> activityOn();

  /// Sends an HTTP request to end user activity
  ///
  /// the request is sent to [AuthEndpoint.activityOff] and
  /// the response is as [Response]
  Future<Response> activityOff(ActivityRequest request);

  /// Sends an HTTP request to try login user with spotify
  /// credentials
  ///
  /// The request is sent to [AuthEndpoint.spotifyLogin] and
  /// the response is a [SignInResponse]
  Future<SignInResponse> spotifyLogin(SpotifyLoginRequest request);
}