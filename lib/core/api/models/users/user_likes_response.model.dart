class UserLikesResponse {
  String idLike;
  String idPost;
  String idProfile;

  UserLikesResponse({
    this.idLike,
    this.idPost,
    this.idProfile,
  });

  Map<String, dynamic> toJson() {
    return {
      "_id": idLike,
      "id_post": idPost,
      "id_profile": idProfile,
    };
  }

  factory UserLikesResponse.fromJson(dynamic data) {
    return UserLikesResponse(
      idLike: data['_id'],
      idPost: data['id_post'],
      idProfile: data['id_profile'],
    );
  }
}
