import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';

import '../environment/environment.dart';

class PlaylistEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String getAPlaylist(String playlistId) =>
      "$_apiHost/v1/playlists/$playlistId";

  static String addAPostToPlaylist(String playlistId) =>
      "$_apiHost/v1/playlists/$playlistId";

  static String editAPlaylist(String playlistId) =>
      "$_apiHost/v1/playlists/$playlistId";

  static String deleteAPostFromAPlaylist(String playlistId, String postId) =>
      "$_apiHost/v1/playlists/$playlistId/$postId";

  static String createPlaylist = "$_apiHost/v1/playlists";

  static String deleteAPlaylist(String playlistId) =>
      "$_apiHost/v1/playlists/$playlistId";
}
