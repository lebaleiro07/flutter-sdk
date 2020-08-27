import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/repositories/tags/impl/tags_repository_impl.dart';
import 'package:music_playce_sdk/core/api/repositories/tags/tags_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'core/api/environment.dart';
import 'core/api/interceptors/refresh_token_interceptor.dart';
import 'core/api/interceptors/set_token_interceptor.dart';
import 'core/api/models/auth/refresh_token_response.model.dart';
import 'core/api/repositories/impl/notification_repository_impl.dart';
import 'core/api/repositories/impl/places_repository_impl.dart';
import 'core/api/repositories/impl/playlists_repository_impl.dart';
import 'core/api/repositories/impl/user_repository_impl.dart';
import 'core/api/repositories/notification_repository.dart';
import 'core/api/repositories/places_repository.dart';
import 'core/api/repositories/playlists_repository.dart';
import 'core/api/repositories/post/impl/post_repository_impl.dart';
import 'core/api/repositories/post/post_repository.dart';
import 'core/api/repositories/search/impl/search_repository_impl.dart';
import 'core/api/repositories/search/search_repository.dart';
import 'core/api/repositories/users_repository.dart';
import 'core/api/repositories/v3/auth/auth_repository.dart';
import 'core/api/repositories/v3/auth/auth_repository_impl.dart';
import 'core/api/services/auth_service.dart';
import 'core/api/services/impl/auth_service_impl.dart';
import 'core/http/impl/music_playce_http_impl.dart';
import 'core/http/music_playce_http.dart';
import 'core/http/music_playce_http_headers.dart';

class MusicPlayceSdk {
  void registerSingletons(Environment environment) {
    GetIt.instance
        .registerSingleton<MusicPlayceHttpHeaders>(MusicPlayceHttpHeaders());

    final _musicPlayceHttp = MusicPlayceHttpImpl();

    GetIt.instance
        .registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());

    GetIt.instance.registerSingleton<AuthRepository>(AuthRepositoryV3(
        _musicPlayceHttp,
        secureStorage: GetIt.instance<FlutterSecureStorage>()));
    GetIt.instance.registerSingleton<AuthService>(
        AuthServiceImpl(authRepository: GetIt.instance<AuthRepository>()));

    GetIt.instance.registerSingleton<NotificationRepository>(
        NotificationRepositoryImpl(httpClient: _musicPlayceHttp));

    GetIt.instance.registerSingleton<PostRepository>(
        PostRepositoryImpl(_musicPlayceHttp));

    GetIt.instance.registerSingleton<SearchRepository>(
        SearchRepositoryImpl(_musicPlayceHttp));

    GetIt.instance.registerSingleton<PlaylistsRepository>(
        PlaylistsRepositoryImpl(httpClient: _musicPlayceHttp));

    GetIt.instance.registerSingleton<TagsRepository>(
      TagsRepositoryImpl(
        httpClient: _musicPlayceHttp
      )
    );

    GetIt.instance.registerSingleton<UserRepository>(
        UserRepositoryImpl(httpClient: _musicPlayceHttp));

    GetIt.instance.registerSingleton<PlacesRepository>(
        PlacesRepositoryImpl(httpClient: _musicPlayceHttp));

    GetIt.instance.registerSingleton<Environment>(environment);

    GetIt.instance.registerSingleton<BehaviorSubject<RefreshTokenResponse>>(
        BehaviorSubject<RefreshTokenResponse>());

    GetIt.instance.registerSingleton<MusicPlayceHttp>(_musicPlayceHttp);

    _musicPlayceHttp.interceptors.addAll([
      SetTokenInterceptor(),
      RefreshTokenInterceptor(),
    ]);
  }
}

void main() {}
