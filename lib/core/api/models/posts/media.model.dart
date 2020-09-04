import 'dart:convert';

import 'meta.model.dart';

class Media {
  String idMedia;
  String mediaName;
  String idProfile;
  String url;
  String type;
  bool processed;
  Meta meta;
  List<String> idTags;
  bool published;
  List<String> resources;

  Media({
    this.idMedia,
    this.mediaName,
    this.idProfile,
    this.url,
    this.type,
    this.processed,
    this.meta,
    this.idTags,
    this.published,
    this.resources,
  });

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => new Media(
        idMedia: json['_id'] != null ? json['_id'] : null,
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
        resources: json["resources"] == null
            ? null
            : List<dynamic>.from(json["resources"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "_id": idMedia == null ? null : idMedia,
        "name": mediaName == null ? null : mediaName,
        "id_profile": idProfile == null ? null : idProfile,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "processed": processed == null ? null : processed,
        "meta": meta == null ? null : meta.toMap(),
        "id_tags":
            idTags == null ? null : List<String>.from(idTags.map((x) => x)),
        "published": published == null ? null : published,
        "resources": resources == null
            ? null
            : List<String>.from(resources.map((x) => x)),
      };
}
