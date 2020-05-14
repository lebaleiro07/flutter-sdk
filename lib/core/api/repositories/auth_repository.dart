import 'package:music_playce_sdk/core/api/models/auth/auth_credentials.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signin_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signout_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signup_request.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/signup_response.model.dart';
import 'package:music_playce_sdk/core/api/models/auth/validate_token_response.model.dart';

abstract class AuthRepository {

  //Send a request to signin route with the given credentials and
  //returns the token info for the user
  Future<SignInResponse> signin(AuthCredentials credentials);

  //Send a request to signup route with the given credentials, and
  //returns the token info for the user
  Future<SignUpResponse> signup(SignUpRequest request);

  //Send a request for the refresh token endpoint to get a new access
  //token with the given refresh token
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest token);

  //Send a request for the validate token endpoint to get the validation
  //status for the token
  Future<ValidateTokenResponse> validateToken(String token);

  //Stores the user authentication info on device, using the secure
  //storage for keep the tokens safe
  Future<void> storeToken(RefreshTokenResponse refreshTokenResponse);

  Future<SignOutResponse> logout(String token);
}