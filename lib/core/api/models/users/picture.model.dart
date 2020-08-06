import 'dart:convert';

class Picture {
  String idPicture;
  String idPictureName;
  String idProfile;
  String url;
  String type;
  bool processed;
  List<String> idTags;
  bool published;
  List<String> resources;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  bool deleted;

  Picture({
    this.idPicture,
    this.idPictureName,
    this.idProfile,
    this.url,
    this.type,
    this.processed,
    this.idTags,
    this.published,
    this.resources,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.deleted,
  });

  factory Picture.fromJson(String str) => Picture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Picture.fromMap(Map<String, dynamic> json) => new Picture(
        idPicture: json["_id"] == null ? null : json["_id"],
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
        "_id": idPicture == null ? null : idPicture,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
      };
}
