class PostDetailEvent {
  String userId;
  String userName;
  String postName;
  String postId;

  PostDetailEvent({this.userId, this.userName, this.postName, this.postId});

  PostDetailEvent.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] != null ? json['user_id'] : null;
    userName = json['user_name'] != null ? json['user_name'] : null;
    postName = json['name'] != null ? json['name'] : null;
    postId = json['post_id'] != null ? json['post_id'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['post_name'] = this.postName;
    data['post_id'] = this.postId;
    return data;
  }
}
