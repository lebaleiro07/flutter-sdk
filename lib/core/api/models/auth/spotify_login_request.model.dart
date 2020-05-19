class SpotifyLoginRequest {
  String redirectUri;
  String code;

  SpotifyLoginRequest({this.redirectUri, this.code});

  SpotifyLoginRequest.fromJson(Map<String, dynamic> json) {
    redirectUri = json['redirect_uri'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redirect_uri'] = this.redirectUri;
    data['code'] = this.code;
    return data;
  }
}
