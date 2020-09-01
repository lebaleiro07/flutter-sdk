import 'dart:convert';

import '../posts/meta.model.dart';

class CreateMediaResponse {
  String mediaName;
  String idProfile;
  String url;
  String type;
  bool processed;
  Meta meta;
  List<String> idTags;
  bool published;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  String idMedia;
  String originalUrl;

  CreateMediaResponse({
    this.mediaName,
    this.idProfile,
    this.url,
    this.type,
    this.processed,
    this.meta,
    this.idTags,
    this.published,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.idMedia,
    this.originalUrl,
  });

  factory CreateMediaResponse.fromJson(String str) =>
      CreateMediaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateMediaResponse.fromMap(Map<String, dynamic> json) =>
      new CreateMediaResponse(
        mediaName: json["name"] == null ? null : json["name"],
        idProfile: json["id_profile"] == null ? null : json["id_profile"],
        url: json["url"] == null ? null : json["url"],
        type: json["type"] == null ? null : json["type"],
        processed: json['processed'] == null ? null : json['processed'],
        meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
        idTags: json["id_tags"] == null
            ? null
            : List<String>.from(json["id_tags"].map((x) => x)),
        published: json['published'] == null ? null : json['published'],
        deleted: json['deleted'] == null ? null : json['deleted'],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
        idMedia: json['_id'] != null ? json['_id'] : null,
        originalUrl: json["original_url"] == null ? null : json["original_url"],
      );

  Map<String, dynamic> toMap() => {
        "name": mediaName == null ? null : mediaName,
        "id_profile": idProfile == null ? null : idProfile,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "processed": processed == null ? null : processed,
        "meta": meta == null ? null : meta.toMap(),
        "id_tags":
            idTags == null ? null : List<String>.from(idTags.map((x) => x)),
        "published": published == null ? null : published,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
        "_id": idMedia == null ? null : idMedia,
        "original_url": originalUrl == null ? null : originalUrl,
      };
}
