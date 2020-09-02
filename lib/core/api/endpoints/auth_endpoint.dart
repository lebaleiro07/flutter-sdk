import 'package:get_it/get_it.dart';

import '../environment/environment.dart';

class AuthEndpoint {
  static final _env = GetIt.instance<Environment>();
  
  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String signin = "$_apiHost/v2/auth/signin";

  static String signup = "$_apiHost/v2/auth/signup";

  static String refresh = "$_apiHost/v2/auth/refresh";

  static String validate(String token) =>
      "$_apiHost/v1/auth/validate/$token";

  static String logout(String deviceToken) =>
      "$_apiHost/v1/auth/signout?device_token=$deviceToken";

  static String resendEmail = "$_apiHost/v1/auth/signup/verify";

  static String terms = "$_apiHost/v1/auth/me/accept_terms";

  static String recoverPassword = "$_apiHost/v1/auth/forgot";

  static String activity = "$_apiHost/v1/auth/me/activity";

  static String activityOff(String activityId) =>
      "$_apiHost/v1/auth/me/activity/$activityId";

  static String social = "$_apiHost/v1/auth/social";

  static String spotifyLogin = "$social/spotify";
}
