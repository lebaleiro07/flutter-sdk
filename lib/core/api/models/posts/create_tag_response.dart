import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/models/posts/meta.model.dart';

class CreateTagResponse {
  String tagName;
  HexColor color;
  String idProfile;
  Meta meta;
  int followers;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  String tagId;

  CreateTagResponse({
    this.tagName,
    this.color,
    this.idProfile,
    this.meta,
    this.followers,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.tagId,
  });

  factory CreateTagResponse.fromJson(String str) =>
      CreateTagResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateTagResponse.fromMap(Map<String, dynamic> json) =>
      CreateTagResponse(
        tagName: json["name"] == null ? null : json["name"],
        color: json["color"] == null ? null : HexColor(json["color"]),
        idProfile: json["id_profile"] == null ? null : json["id_profile"],
        meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
        followers: json["followers"] == null ? null : json["followers"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
        tagId: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "name": tagName == null ? null : tagName,
        "color": color == null ? null : '#${color.value.toRadixString(16)}',
        "id_profile": idProfile == null ? null : idProfile,
        "meta": meta == null ? null : meta.toMap(),
        "followers": followers == null ? null : followers,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
        "_id": tagId == null ? null : tagId,
      };
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
