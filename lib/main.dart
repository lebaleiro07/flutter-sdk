import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';
import 'package:music_playce_sdk/core/api/interceptors/set_token_interceptor.dart';
import 'package:music_playce_sdk/core/api/models/auth/refresh_token_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/auth_repository.dart';
import 'package:music_playce_sdk/core/api/repositories/impl/auth_repository_impl.dart';
import 'package:music_playce_sdk/core/api/services/auth_service.dart';
import 'package:music_playce_sdk/core/api/services/impl/auth_service_impl.dart';
import 'package:music_playce_sdk/core/http/impl/music_playce_http_impl.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_headers.dart';
import 'package:rxdart/rxdart.dart';

import 'core/api/interceptors/refresh_token_interceptor.dart';
import 'core/http/impl/music_playce_http_impl.dart';

class MusicPlayceSdk {
  void registerSingletons(Environment environment) {
    GetIt.instance.registerSingleton<MusicPlayceHttpHeaders>(MusicPlayceHttpHeaders());

    final _musicPlayceHttp = MusicPlayceHttpImpl();

    GetIt.instance.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
    GetIt.instance.registerSingleton<AuthRepository>(AuthRepositoryImpl(
        httpClient: _musicPlayceHttp,
        flutterSecureStorage: GetIt.instance<FlutterSecureStorage>()
    ));
    GetIt.instance.registerSingleton<AuthService>(AuthServiceImpl(
        authRepository: GetIt.instance<AuthRepository>()
    ));
    GetIt.instance.registerSingleton<Environment>(environment);

    GetIt.instance.registerSingleton<BehaviorSubject<RefreshTokenResponse>>(
      BehaviorSubject<RefreshTokenResponse>()
    );

    GetIt.instance.registerSingleton<MusicPlayceHttp>(_musicPlayceHttp);

    _musicPlayceHttp.interceptors.addAll([
      SetTokenInterceptor(),
      RefreshTokenInterceptor(),
    ]);
  }
}

void main() {
  MusicPlayceSdk().registerSingletons(Environment.dev());
}
