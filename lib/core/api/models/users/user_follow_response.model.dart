class UserFollowResponse {
  String message;

  UserFollowResponse({this.message});

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }

  factory UserFollowResponse.fromJson(dynamic data) {
    return UserFollowResponse(
      message: data['message'],
    );
  }
}
