class RefreshTokenResponse {
  String iss;
  String token;
  String refreshToken;

  RefreshTokenResponse({this.iss, this.token, this.refreshToken});

  RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    iss = json['iss'] != null ? json['iss'] : null;
    token = json['token'] != null ? json['token'] : null;
    refreshToken = json['refresh_token'] != null ? json['refresh_token'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['iss'] = this.iss;
    data['token'] = null;
    data['refresh_token'] = this.refreshToken;

    return data;
  }
}
