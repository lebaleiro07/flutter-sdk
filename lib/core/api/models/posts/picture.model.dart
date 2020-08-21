import 'dart:convert';

import 'media.model.dart';

class Picture extends Media {
  String id;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;

  Picture({
    this.id,
    String url,
    String type,
    List<String> resources,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
  }) : super(url: url, type: type, resources: resources);

  factory Picture.fromJson(String str) => Picture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Picture.fromMap(Map<String, dynamic> json) => new Picture(
        id: json["_id"] == null ? null : json["_id"],
        url: json["url"] == null ? null : json["url"],
        type: json["type"] == null ? null : json["type"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
      };
}
