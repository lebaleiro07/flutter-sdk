import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/posts/meta.model.dart';

import '../users/picture.model.dart';
import '../users/user_response.model.dart';
import 'like.model.dart';
import 'music.model.dart';
import 'release.model.dart';
import 'tag.model.dart';

class CreatePostResponse {
  String idPost;
  String postName;
  String idUploader;
  String idMedia;
  double duration;
  String idPicture;
  List<String> idComposers;
  List<String> idInterpreters;
  List<String> idTags;
  String lyrics;
  int likes;
  int plays;
  int indications;
  int acceptedTerms;
  bool processed;
  Meta meta;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;

  CreatePostResponse({
    this.idPost,
    this.postName,
    this.idUploader,
    this.idMedia,
    this.duration,
    this.idPicture,
    this.idComposers,
    this.idInterpreters,
    this.idTags,
    this.lyrics,
    this.likes,
    this.plays,
    this.indications,
    this.acceptedTerms,
    this.processed,
    this.meta,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
  });

  factory CreatePostResponse.fromJson(String str) =>
      CreatePostResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePostResponse.fromMap(Map<String, dynamic> json) =>
      new CreatePostResponse(
        idPost: json["_id"] == null ? null : json["_id"],
        postName: json["name"] == null ? null : json["name"],
        idUploader: json["id_uploader"] == null ? null : json["id_uploader"],
        idMedia: json["id_media"] == null ? null : json["id_media"],
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
        idPicture: json["id_picture"] == null ? null : json["id_picture"],
        idComposers: json["id_composers"] == null
            ? null
            : List<String>.from(json["id_composers"].map((x) => x)),
        idInterpreters: json["id_interpreters"] == null
            ? null
            : List<String>.from(json["id_interpreters"].map((x) => x)),
        idTags: json["id_tags"] == null
            ? null
            : List<String>.from(json["id_tags"].map((x) => x)),
        lyrics: json["lyrics"] == null ? null : json["lyrics"],
        likes: json["likes"] == null ? null : json["likes"],
        plays: json["plays"] == null ? null : json["plays"],
        indications: json["indications"] == null ? null : json["indications"],
        acceptedTerms:
            json["accepted_terms"] == null ? null : json["accepted_terms"],
        processed: json["processed"] == null ? null : json["processed"],
        meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": idPost == null ? null : idPost,
        "name": postName == null ? null : postName,
        "id_uploader": idUploader == null ? null : idUploader,
        "id_media": idMedia == null ? null : idMedia,
        "duration": duration == null ? null : duration,
        "id_picture": idPicture == null ? null : idPicture,
        "id_composers": idComposers == null
            ? null
            : List<String>.from(idComposers.map((x) => x)),
        "id_interpreters": idInterpreters == null
            ? null
            : List<String>.from(idInterpreters.map((x) => x)),
        "id_tags":
            idTags == null ? null : List<String>.from(idTags.map((x) => x)),
        "lyrics": lyrics == null ? null : lyrics,
        "likes": likes == null ? null : likes,
        "plays": plays == null ? null : plays,
        "indications": indications == null ? null : indications,
        "accepted_terms": acceptedTerms == null ? null : acceptedTerms,
        "processed": processed == null ? null : processed,
        "meta": meta == null ? null : meta.toMap(),
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
      };
}
