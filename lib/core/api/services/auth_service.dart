
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';

/// The abstract class for AuthService
///
/// The subclasses need to implement his methods
/// in order to communicate with the auth endpoints
abstract class AuthService {
  /// Communicate with the [AuthRepository] in order
  /// to validate the [token]
  ///
  /// Returns a boolean that tells if the token is valid
  /// or not
  Future<bool> validateToken(String token);

  /// Clear user session by deleting all the information about
  /// his session, like tokens
  Future<void> clearSession();
}