import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';

class AuthEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String signin = "${_env.apiHost}/v3/auth/login";

  static String signup = "${_env.apiHost}/v3/auth/register";

  static String confirm(String code) => "${_env.apiHost}/v3/auth/confirmation/$code";

  static String refresh = "${_env.apiHost}/v2/auth/refresh";

  static String validate(String token) => "${_env.apiHost}/v1/auth/validate/$token";

  static String logout(String deviceToken) => "${_env.apiHost}/v1/auth/signout?device_token=$deviceToken";

  static String forgotPassword(String email) => "${_env.apiHost}/v3/auth/forgot-password/$email?isMobile=true";

  static String resetPassword = "${_env.apiHost}/v3/auth/reset-password?isMobile=true";

  static String activity = "${_env.apiHost}/v1/auth/me/activity";

  static String activityOff(String activityId) => "${_env.apiHost}/v1/auth/me/activity/$activityId";

  static String resendConfirmation = "${_env.apiHost}/v3/auth/resend-confirmation";
}