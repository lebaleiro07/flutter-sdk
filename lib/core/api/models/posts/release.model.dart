import 'dart:convert';

import '../users/user_response.model.dart';
import 'links.model.dart';
import 'music.model.dart';
import 'posts.model.dart';

class Release {
  String id;
  String name;
  List<User> interpreters;
  Music media;
  Music video;
  Post post;
  Links links;

  Release(
      {this.id,
      this.name,
      this.media,
      this.video,
      this.interpreters,
      this.post,
      this.links});

  factory Release.fromJson(String str) => Release.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Release.fromMap(Map<String, dynamic> json) {
    return new Release(
      id: json["_id"] == null ? null : json["_id"],
      name: json["name"] == null ? null : json["name"],
      media: json["media"] == null ? null : Music.fromMap(json["media"]),
      video: json["video"] == null ? null : Music.fromMap(json["video"]),
      interpreters: json["interpreters"] == null
          ? null
          : new List<User>.from(
              json["interpreters"].map((x) => User.fromMap(x))),
      post: json["post"] == null ? null : Post.fromMap(json["post"]),
      links: json["links"] == null ? null : Links.fromMap(json["links"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "media": media == null ? null : media.toMap(),
        "video": video == null ? null : video.toMap(),
        "interpreters": interpreters == null
            ? null
            : new List<dynamic>.from(interpreters.map((x) => x.toMap())),
        "post": post == null ? null : post.toMap(),
        "links": links == null ? null : links.toMap(),
      };
}
