import 'package:music_playce_sdk/core/api/models/auth/auth_extra_body.model.dart';

class SignInResponse {
  String iss;
  String token;
  String refreshToken;
  AuthExtraBody authExtraBody;

  SignInResponse({ this.iss, this.token, this.refreshToken });

  SignInResponse.fromJson(Map<String, dynamic> json) {
    iss = json['iss'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    authExtraBody = AuthExtraBody.fromJson(json['extras']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iss'] = this.iss;
    data['token'] = token;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}