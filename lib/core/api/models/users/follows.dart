import 'dart:convert';

class Follows {
  List<String> profiles;
  List<String> tags;

  Follows({
    this.profiles,
    this.tags,
  });

  factory Follows.fromJson(String str) => Follows.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Follows.fromMap(Map<String, dynamic> json) => new Follows(
        profiles: json["profiles"] == null
            ? null
            : List<String>.from(json["profiles"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "profiles":
            profiles == null ? null : List<String>.from(profiles.map((x) => x)),
        "tags": tags == null ? null : List<String>.from(tags.map((x) => x)),
      };
}