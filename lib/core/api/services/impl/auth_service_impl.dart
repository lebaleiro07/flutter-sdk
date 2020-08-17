import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/repositories/v3/auth/auth_repository.dart';
import 'package:music_playce_sdk/core/api/services/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository authRepository;

  const AuthServiceImpl({
    @required this.authRepository,
  });

  Future<bool> validateToken(String token) async{
    if (token.isNotEmpty) {
      final validateTokenResponse = await authRepository.validateToken(token);

      if (validateTokenResponse.message != "Token is valid") {
        return false;
      }

      return true;
    }

    return false;
  }

  @override
  Future<void> clearSession() {
    return GetIt.instance<FlutterSecureStorage>()
      .delete(key: "token");
  }
}