import 'package:get_it/get_it.dart';

import '../environment.dart';

class PlaylistEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String getAPlaylist(String playlistId) =>
      "${_env.apiHost}/v1/playlists/$playlistId";

  static String addAPostToPlaylist(String playlistId) =>
      "${_env.apiHost}/v1/playlists/$playlistId";

  static String editAPlaylist(String playlistId) =>
      "${_env.apiHost}/v1/playlists/$playlistId";

  static String deleteAPostFromAPlaylist(String playlistId, String postId) =>
      "${_env.apiHost}/v1/playlists/$playlistId/$postId";

  static String createPlaylist = "${_env.apiHost}/v1/playlists";

  static String deleteAPlaylist(String playlistId) =>
      "${_env.apiHost}/v1/playlists/$playlistId";
}
