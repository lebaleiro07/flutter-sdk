import 'dart:convert';

import 'media.model.dart';
import 'meta.model.dart';

class Music extends Media {
  String id;
  bool processed;
  Meta meta;
  String originalUrl;

  Music({
    this.id,
    String url,
    String type,
    this.processed,
    this.meta,
    List<String> resources,
    this.originalUrl,
  }) : super(url: url, type: type, resources: resources);

  factory Music.fromJson(String str) => Music.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Music.fromMap(Map<String, dynamic> json) => Music(
        id: json["_id"] == null ? null : json["_id"],
        url: json["url"] == null ? null : json["url"],
        type: json["type"] == null ? null : json["type"],
        processed: json["processed"] == null ? null : json["processed"],
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        originalUrl: json["original_url"] == null ? null : json["original_url"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "url": url == null ? null : url,
        "type": type == null ? null : type,
        "processed": processed == null ? null : processed,
        "meta": meta == null ? null : meta.toMap(),
        "original_url": originalUrl == null ? null : originalUrl,
      };
}
