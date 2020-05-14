import 'package:music_playce_sdk/core/api/models/auth/auth_extra_body.model.dart';

class SignUpResponse {
  String iss;
  String token;
  String refreshToken;
  AuthExtraBody authExtraBody;

  SignUpResponse({ this.iss, this.token, this.refreshToken });

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    iss = json['iss'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    authExtraBody = json['extras'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iss'] = this.iss;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}