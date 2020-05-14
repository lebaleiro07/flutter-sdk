abstract class AuthService {
  //Receive a token and returns a boolean that indicate
  //if the token still valid or not
  Future<bool> validateToken(String token);

  //Clear user session by deleting the info stored
  //on the secure storage
  Future<void> clearSession();
}