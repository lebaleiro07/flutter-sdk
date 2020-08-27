import 'dart:convert';

import 'package:flutter/material.dart';

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
