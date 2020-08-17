import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';

class UserEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String getUser(String userId) => "${_env.apiHost}/v1/users/$userId";

  static String updateUser(String userId) => "${_env.apiHost}/v1/users/$userId";

  static String getUserLikes(String userId) =>
      "${_env.apiHost}/v1/users/$userId/likes";

  static String followUser(String userId) =>
      "${_env.apiHost}/v1/users/$userId/follow";

  static String unfollowUser(String userId) =>
      "${_env.apiHost}/v1/users/$userId/follow";

  static String getAllUserPlaylists(String userId) =>
      "${_env.apiHost}/v1/users/$userId/playlists";

  static String checkEmail = "${_env.apiHost}/v2/users/check-email";

  static String checkPhone = "${_env.apiHost}/v2/users/check-phone";

  static String getTerm(String name) => "${_env.apiHost}/v1/terms/$name";
}
