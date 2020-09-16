import 'dart:convert';
import 'package:music_playce_sdk/core/api/models/posts/meta.model.dart';

class Draft {
  String id;
  String name;
  String idProfile;
  String url;
  String type;
  bool processed;
  Meta meta;
  List<String> idTags;
  bool published;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  List<String> resources;

  Draft({
    this.id,
    this.name,
    this.idProfile,
    this.url,
    this.type,
    this.processed,
    this.meta,
    this.idTags,
    this.published,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.resources,
  });

  factory Draft.fromJson(String str) => Draft.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Draft.fromMap(Map<String, dynamic> json) => new Draft(
        id: json['_id'] != null ? json['_id'] : null,
        name: json["name"] == null ? null : json["name"],
        idProfile: json["id_profile"] == null ? null : json["id_profile"],
        url: json["url"] == null ? null : json["url"],
        type: json["type"] == null ? null : json["type"],
        processed: json['processed'] == null ? null : json['processed'],
        meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
        idTags: json["id_tags"] == null
            ? null
            : List<String>.from(json["id_tags"].map((x) => x)),
        published: json['published'] == null ? null : json['published'],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
        resources: json["resources"] == null
            ? null
            : List<dynamic>.from(json["resources"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "id_profile": idProfile == null ? null : idProfile,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "processed": processed == null ? null : processed,
        "meta": meta == null ? null : meta.toMap(),
        "id_tags":
            idTags == null ? null : List<String>.from(idTags.map((x) => x)),
        "published": published == null ? null : published,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
        "resources": resources == null
            ? null
            : List<String>.from(resources.map((x) => x)),
      };
}
