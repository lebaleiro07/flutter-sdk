class Share {
  String postId;
  String profileId;
  String target;
  int playbackMoment;
  Map meta;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  String id;

  Share(
      {this.postId,
      this.profileId,
      this.target,
      this.playbackMoment,
      this.meta,
      this.deleted,
      this.datetimeCreated,
      this.datetimeUpdated,
      this.id});

  Share.fromJson(Map<String, dynamic> json) {
    postId = json['id_post'];
    profileId = json['id_profile'];
    target = json['target'];
    playbackMoment = int.tryParse(json['playback_moment']);
    meta = json['meta'];
    deleted = json['deleted'];
    datetimeCreated = DateTime.parse(json['datetime_created']);
    datetimeUpdated = DateTime.parse(json['datetime_updated']);
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_post'] = this.postId;
    data['id_profile'] = this.profileId;
    data['target'] = this.target;
    data['playback_moment'] = this.playbackMoment;
    data['meta'] = this.meta;
    data['deleted'] = this.deleted;
    data['datetime_created'] = this.datetimeCreated.toIso8601String();
    data['datetime_updated'] = this.datetimeUpdated.toIso8601String();
    data['_id'] = this.id;
    return data;
  }
}
