import 'dart:convert';

class Genre {
  String id;
  String name;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;

  Genre({
    this.id,
    this.name,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
  });

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genre.fromMap(Map<String, dynamic> json) => new Genre(
        id: json['_id'] != null ? json['_id'] : null,
        name: json["name"] == null ? null : json["name"],
        deleted: json['deleted'] == null ? null : json['deleted'],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
      };
}
