import 'dart:convert';

import 'meta.model.dart';

class Media {
  String id;
  String url;
  String type;
  bool processed;
  List<String> resources;
  Meta meta;
  bool published;

  Media(
      {this.id,
      this.url,
      this.type,
      this.resources,
      this.processed,
      this.meta,
      this.published});

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => new Media(
      id: json['_id'] != null ? json['_id'] : null,
      url: json["url"] == null ? null : json["url"],
      type: json["type"] == null ? null : json["type"],
      resources: json["resources"] == null
          ? null
          : List<dynamic>.from(json["resources"].map((x) => x)),
      meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
      processed: json['processed'] == null ? null : json['processed'],
      published: json['published'] == null ? null : json['published']);

  Map<String, dynamic> toMap() => {
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "resources": resources == null
            ? null
            : List<String>.from(resources.map((x) => x)),
      };
}
