import 'package:music_playce_sdk/core/api/models/auth/auth_extra_body.model.dart';
import 'package:music_playce_sdk/core/utils/map_utils.dart';

class SignInResponse {
  String iss;
  String token;
  String refreshToken;
  AuthExtraBody authExtraBody;

  SignInResponse({ this.iss, this.token, this.refreshToken });

  SignInResponse.fromJson(Map<String, dynamic> json) {
    iss = json.isNotNull ? json['iss'] : null;
    token = json.isNotNull ? json['token'] : null;
    refreshToken = json.isNotNull ? json['refresh_token'] : null;
    authExtraBody = json.isNotNull ? AuthExtraBody.fromJson(json['extras']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iss'] = this.iss;
    data['token'] = token;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}