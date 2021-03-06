import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/posts/meta.model.dart';

import '../users/picture.model.dart';
import '../users/user_response.model.dart';
import 'like.model.dart';
import 'music.model.dart';
import 'release.model.dart';
import 'tag.model.dart';

class Post {
  String id;
  String name;
  double duration;
  Music media;
  int plays;
  int indications;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  int likes;
  List<User> composers;
  List<User> interpreters;
  Like like;
  Picture picture;
  User uploader;
  String lyrics;
  String cursor;
  List<Tag> tags;
  bool error;
  List<Release> releases;

  String idUploader;
  int acceptedTerms;
  bool processed;
  Meta meta;
  String type;


  Post({
    this.id,
    this.name,
    this.duration,
    this.media,
    this.plays,
    this.indications,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.likes,
    this.composers,
    this.interpreters,
    this.like,
    this.picture,
    this.uploader,
    this.lyrics,
    this.cursor,
    this.tags,
    this.error,
    this.releases,
    this.idUploader,
    this.acceptedTerms,
    this.processed,
    this.meta,
    this.type,
  });

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) {
    try {
      return new Post(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
        media: json["media"] == null ? null : Music.fromMap(json["media"]),
        plays: json["plays"] == null ? null : json["plays"],
        idUploader: json["id_uploader"] == null ? null : json["id_uploader"],
        acceptedTerms: json["accepted_terms"] == null ? null : json["accepted_terms"],
        processed: json["processed"] == null ? null : json["processed"],
        meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
        type: json["type"] == null ? null : json["type"],
        indications: json["indications"] == null ? null : json["indications"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
        likes: json["likes"] == null ? null : json["likes"],
        composers: json["composers"] == null
            ? null
            : new List<User>.from(
                json["composers"].map((x) => User.fromMap(x))),
        interpreters: json["interpreters"] == null
            ? null
            : new List<User>.from(
                json["interpreters"].map((x) => User.fromMap(x))),
        tags: json["tags"] == null
            ? null
            : new List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
        like: json["like"] == null ? null : Like.fromMap(json["like"]),
        picture:
            json["picture"] == null ? null : Picture.fromMap(json["picture"]),
        uploader:
            json["uploader"] == null ? null : User.fromMap(json["uploader"]),
        lyrics: json["lyrics"] == null ? null : json["lyrics"],
        cursor: json["cursor"] == null ? null : json["cursor"],
        releases: json["releases"] == null
            ? null
            : List<Release>.from(
                json["releases"].map((x) => Release.fromMap(x))),
      );
    } catch (e) {
      print(e);
      return Post(
        error: true,
        cursor: json["cursor"] == null ? null : json["cursor"],
      );
    }
  }

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "duration": duration == null ? null : duration,
        "media": media == null ? null : media.toMap(),
        "plays": plays == null ? null : plays,
        "id_uploader": idUploader == null ? null : idUploader,
        "accepted_terms": acceptedTerms == null ? null : acceptedTerms,
        "processed": processed == null ? null : processed,
        "meta": meta == null ? null : meta.toMap(),
        "type": type == null ? null : type,
        "indications": indications == null ? null : indications,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
        "likes": likes == null ? null : likes,
        "composers": composers == null
            ? null
            : new List<dynamic>.from(composers.map((x) => x.toMap())),
        "interpreters": interpreters == null
            ? null
            : new List<dynamic>.from(interpreters.map((x) => x.toMap())),
        "tags": tags == null
            ? null
            : new List<dynamic>.from(tags.map((x) => x.toMap())),
        "like": like == null ? null : like.toMap(),
        "picture": picture == null ? null : picture.toMap(),
        "uploader": uploader == null ? null : uploader.toMap(),
        "lyrics": lyrics == null ? null : lyrics,
        "cursor": cursor == null ? null : cursor,
        "releases": releases == null
            ? null
            : new List<dynamic>.from(releases.map((x) => x.toMap())),
      };
}
