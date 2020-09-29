class IndicationEvent {
  String name;
  String postId;
  String userId;
  String playbackMoment;
  String uploader;
  String uploaderId;

  IndicationEvent({
    this.name,
    this.userId,
    this.postId,
    this.uploader,
    this.uploaderId
  });

  IndicationEvent.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? json['name'] : null;
    postId = json['id_post'] != null ? json['id_post'] : null;
    userId = json['user_id'] != null ? json['user_id'] : null;
    playbackMoment = json['playback_moment'] != null ? json['playback_moment'] : null;
    uploader = json['uploader'] != null ? json['uploader'] : null;
    uploaderId = json['uploader_id'] != null ? json['uploader_id'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['id_post'] = this.postId;
    data['playback_moment'] = this.playbackMoment;
    data['uploader'] = this.uploader;
    data['uploader_id'] = this.uploaderId;
    return data;
  }
}