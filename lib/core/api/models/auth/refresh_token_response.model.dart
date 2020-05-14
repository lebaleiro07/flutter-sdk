class RefreshTokenResponse {
  String iss;
  String token;
  String refreshToken;

  RefreshTokenResponse({ this.iss, this.token, this.refreshToken });

  RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    iss = json['iss'];
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['iss'] = this.iss;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;

    return data;
  }
}