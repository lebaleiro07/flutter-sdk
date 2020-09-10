import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/models/posts/hexColor.dart';

class Tag {
  String id;
  String name;
  HexColor color;
  String type;

  Tag({
    this.id,
    this.name,
    this.color,
    this.type,
  });

  factory Tag.fromJson(String str) => Tag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        color: json["color"] == null ? null : HexColor(json["color"]),
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "color": color == null ? null : '#${color.value.toRadixString(16)}',
        "type" : type == null ? null : type,
      };
}