import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/endpoints/v3/auth_endpoint.dart';
import 'package:music_playce_sdk/core/api/repositories/v3/auth/auth_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class AuthRepositoryV3 implements AuthRepository {
  final MusicPlayceHttp _httpClient;

  const AuthRepositoryV3(this._httpClient);

  @override
  Future<Either<Exception, dynamic>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, dynamic>> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, dynamic>> checkEmail(String email) async{
    try {
      final response = await _httpClient.post(AuthEndpoint.checkEmail, body: {
        "email": email
      });

      final data = jsonDecode(response?.body)['data'];

      return right(data);
    } catch(e) {
      return left(e);
    }
  }
  
  @override
  Future<Either<Exception, dynamic>> checkPhone(String phone) async{
    try {
      final response = await _httpClient.post(AuthEndpoint.checkPhone, body: {
        "phone": phone
      });

      final data = jsonDecode(response?.body)['data'];

      return right(data);
    } catch(e) {
      return left(e);
    }
  }
  
  @override
  Future<Either<Exception, dynamic>> checkUsername(String username) async{
    try {
      final response = await _httpClient.post(AuthEndpoint.checkUsername, body: {
        "username": username
      });

      final data = jsonDecode(response?.body)['data'];

      return right(data);
    } catch(e) {
      return left(e);
    }
  }
  
  @override
  Future<Either<Exception, dynamic>> confirm(String email) async{
    try {
      final response = await _httpClient.post(AuthEndpoint.confirm, body: {
        "email": email
      });

      final data = jsonDecode(response?.body)['data'];

      return Right(data);
    } catch(e) {
      print(e);
      return Left(e);
    }
  }
}