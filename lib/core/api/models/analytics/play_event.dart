class PlayEvent {
  String idPost;
  String name;
  String userId;
  String uploader;
  String uploaderId;
  int moment;

  PlayEvent(
      {this.idPost, this.name, this.userId, this.uploader, this.uploaderId});

  PlayEvent.fromJson(Map<String, dynamic> json) {
    idPost = json['id_post'] != null ? json['id_post'] : null;
    name = json['name'] != null ? json['name'] : null;
    userId = json['user_id'] != null ? json['user_id'] : null;
    uploader = json['uploader'] != null ? json['uploader'] : null;
    uploaderId = json['uploader_id'] != null ? json['uploader_id'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_post'] = this.idPost;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['uploader'] = this.uploader;
    data['uploader_id'] = this.uploaderId;
    return data;
  }
}
