import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, dynamic>> login();

  Future<Either<Exception, dynamic>> register();

  Future<Either<Exception, dynamic>> checkEmail(String email);

  Future<Either<Exception, dynamic>> checkPhone(String phone);

  Future<Either<Exception, dynamic>> checkUsername(String username);

  Future<Either<Exception, dynamic>> confirm(String token);
}