import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';

class AuthEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String signin = "${_env.apiHost}/v2/auth/signin";

  static String signup = "${_env.apiHost}/v2/auth/signup";

  static String refresh = "${_env.apiHost}/v2/auth/refresh";

  static String validate(String token) => "${_env.apiHost}/v1/auth/validate/$token";

  static String logout(String deviceToken) => "${_env.apiHost}/v1/auth/signout?device_token=$deviceToken";

  static String resendEmail = "${_env.apiHost}/v1/auth/signup/verify";

  static String terms = "${_env.apiHost}/v1/auth/me/accept_terms";

  static String recoverPassword = "${_env.apiHost}/v1/auth/forgot";

  static String activity = "${_env.apiHost}/v1/auth/me/activity";

  static String activityOff(String activityId) => "${_env.apiHost}/v1/auth/me/activity/$activityId";

  static String social = "${_env.apiHost}/v1/auth/social";

  static String spotifyLogin = "$social/spotify";
}