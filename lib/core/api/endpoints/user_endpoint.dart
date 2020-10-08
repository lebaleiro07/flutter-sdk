import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';

import '../environment/environment.dart';

class UserEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String getUser(String userId) => "$_apiHost/v2/users/user-and-profile/$userId";

  static String updateUser(String userId) => "$_apiHost/v1/users/$userId";

  static String getUserLikes(String userId) =>
      "$_apiHost/v1/users/$userId/likes";

  static String followUser(String userId) =>
      "$_apiHost/v1/users/$userId/follow";

  static String unfollowUser(String userId) =>
      "$_apiHost/v1/users/$userId/follow";

  static String getAllUserPlaylists(String userId) =>
      "$_apiHost/v1/users/$userId/playlists";

  static String checkEmail = "$_apiHost/v2/users/check-email";

  static String checkPhone = "$_apiHost/v2/users/check-phone";

  static String getTerm(String name) => "$_apiHost/v1/terms/$name";

  static String getAllUsersByName(String name) => "$_apiHost/v1/users/find/$name";

}
