class Indication {
  String id;
  String idProfileFrom;
  String idPost;
  String idProfileTo;
  int listenTimeBefore;
  int playsBefore;
  int playbackMoment;
  int dateCreated;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;

  Indication(
      {this.id,
      this.idProfileFrom,
      this.idPost,
      this.idProfileTo,
      this.listenTimeBefore,
      this.playsBefore,
      this.playbackMoment,
      this.dateCreated,
      this.deleted,
      this.datetimeCreated,
      this.datetimeUpdated});

  Indication.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : null;
    idProfileFrom =
        json['id_profile_from'] != null ? json['id_profile_from'] : null;
    idPost = json['id_post'] != null ? json['id_post'] : null;
    idProfileTo = json['id_profile_to'] != null ? json['id_profile_to'] : null;
    listenTimeBefore =
        json['listen_time_before'] != null ? json['listen_time_before'] : null;
    playsBefore = json['plays_before'] != null ? json['plays_before'] : null;
    playbackMoment =
        json['playback_moment'] != null ? json['playback_moment'] : null;
    dateCreated = json['date_created'] != null ? json['date_created'] : null;
    deleted = json['deleted'] != null ? json['deleted'] : null;
    datetimeCreated = json['datetime_created'] != null
        ? DateTime.parse(json['datetime_created'])
        : null;
    datetimeUpdated = json['datetime_updated'] != null
        ? DateTime.parse(json['datetime_updated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['id_profile_from'] = idProfileFrom;
    data['id_post'] = idPost;
    data['id_profile_to'] = idProfileTo;
    data['listen_time_before'] = listenTimeBefore;
    data['plays_before'] = playsBefore;
    data['playback_moment'] = playbackMoment;
    data['date_created'] = dateCreated;
    data['deleted'] = deleted;
    data['datetime_created'] = datetimeCreated;
    data['datetime_updated'] = datetimeUpdated;
    return data;
  }
}
