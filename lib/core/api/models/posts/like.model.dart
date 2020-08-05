import 'dart:convert';

class Like {
  String id;
  String idPost;
  String idProfile;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  bool deleted;
  int listenTimeBefore;
  int playbackMoment;
  dynamic playbackMomentDislike;
  int playsBefore;

  Like({
    this.id,
    this.idPost,
    this.idProfile,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.deleted,
    this.listenTimeBefore,
    this.playbackMoment,
    this.playbackMomentDislike,
    this.playsBefore,
  });

  factory Like.fromJson(String str) => Like.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Like.fromMap(Map<String, dynamic> json) => new Like(
    id: json["_id"] == null ? null : json["_id"],
    idPost: json["id_post"] == null ? null : json["id_post"],
    idProfile: json["id_profile"] == null ? null : json["id_profile"],
    datetimeCreated: json["datetime_created"] == null
        ? null
        : DateTime.parse(json["datetime_created"]),
    datetimeUpdated: json["datetime_updated"] == null
        ? null
        : DateTime.parse(json["datetime_updated"]),
    deleted: json["deleted"] == null ? null : json["deleted"],
    listenTimeBefore: json["listen_time_before"] == null
        ? null
        : json["listen_time_before"],
    playbackMoment:
    json["playback_moment"] == null ? null : json["playback_moment"],
    playbackMomentDislike: json["playback_moment_dislike"],
    playsBefore: json["plays_before"] == null ? null : json["plays_before"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id == null ? null : id,
    "id_post": idPost == null ? null : idPost,
    "id_profile": idProfile == null ? null : idProfile,
    "datetime_created":
    datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
    "datetime_updated":
    datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
    "deleted": deleted == null ? null : deleted,
    "listen_time_before":
    listenTimeBefore == null ? null : listenTimeBefore,
    "playback_moment": playbackMoment == null ? null : playbackMoment,
    "playback_moment_dislike": playbackMomentDislike,
    "plays_before": playsBefore == null ? null : playsBefore,
  };
}
