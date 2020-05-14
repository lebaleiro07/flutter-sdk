import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';
import 'package:music_playce_sdk/core/api/repositories/impl/auth_repository_impl.dart';
import 'package:music_playce_sdk/core/api/services/auth_service.dart';
import 'package:music_playce_sdk/core/api/services/impl/auth_service_impl.dart';
import 'package:music_playce_sdk/core/http/impl/music_playce_http_impl.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayceSdk {
  void registerSingletons(Environment environment) {
    GetIt.instance.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
    GetIt.instance.registerSingleton<Environment>(environment);
    GetIt.instance.registerSingleton<AuthService>(AuthServiceImpl(
      authRepository: GetIt.instance<AuthRepository>()
    ));
    GetIt.instance.registerSingleton<BehaviorSubject<RefreshTokenResponse>>(
      BehaviorSubject<RefreshTokenResponse>()
    );
    GetIt.instance.registerSingleton<MusicPlayceHttp>(MusicPlayceHttpImpl());
    GetIt.instance.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      httpClient: MusicPlayceHttpImpl(),
      flutterSecureStorage: GetIt.instance<FlutterSecureStorage>()
    ));
  }
}

void main() {
  MusicPlayceSdk().registerSingletons(Environment.dev());
}
