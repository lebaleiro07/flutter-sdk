import '../../../utils/map_utils.dart';
import 'auth_extra_body.model.dart';

class SignUpResponse {
  String iss;
  String token;
  String refreshToken;
  AuthExtraBody authExtraBody;

  SignUpResponse({this.iss, this.token, this.refreshToken});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    print("sdk $json");
    iss = json.isNotNull ? json['iss'] : null;
    token = json.isNotNull ? json['token'] : null;
    refreshToken = json.isNotNull ? json['refresh_token'] : null;
    authExtraBody = json.isNotNull ? json['extras'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iss'] = this.iss;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
