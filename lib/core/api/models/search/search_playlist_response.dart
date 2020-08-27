import 'dart:convert';
import 'package:music_playce_sdk/core/api/models/users/picture.model.dart';
import '../posts/posts.model.dart';

class SearchPlaylistResponse {
  String idPlaylist;
  String idProfile;
  String playlistName;
  String description;
  bool isPublic;
  bool isEditable;
  bool visible;
  String typeSource;
  int length;
  int duration;
  List<Post> posts;
  Picture picture;
  String type;

  SearchPlaylistResponse({
    this.idPlaylist,
    this.idProfile,
    this.playlistName,
    this.description,
    this.isPublic,
    this.isEditable,
    this.visible,
    this.typeSource,
    this.length,
    this.duration,
    this.posts,
    this.picture,
    this.type,
  });

  factory SearchPlaylistResponse.fromJson(String str) =>
      SearchPlaylistResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchPlaylistResponse.fromMap(Map<String, dynamic> json) =>
      SearchPlaylistResponse(
        idPlaylist: json["_id"] == null ? null : json["_id"],
        idProfile: json["id_profile"] == null ? null : json["id_profile"],
        playlistName: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        isPublic: json["is_public"] == null ? null : json["is_public"],
        isEditable: json["is_editable"] == null ? null : json["is_editable"],
        visible: json["visible"] == null ? null : json["visible"],
        typeSource: json["type_source"] == null ? null : json["type_source"],
        length: json["length"] == null ? null : json["length"],
        duration: json["duration"] == null ? null : json["duration"],
        picture: json["picture"] == null ? null : json["picture"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toMap() => {
        "_id": idPlaylist == null ? null : idPlaylist,
        "id_profile": idProfile == null ? null : idProfile,
        "name": playlistName == null ? null : playlistName,
        "description": description == null ? null : description,
        "is_public": isPublic == null ? null : isPublic,
        "is_editable": isEditable == null ? null : isEditable,
        "visible": visible == null ? null : visible,
        "type_source": typeSource == null ? null : typeSource,
        "length": length == null ? null : length,
        "duration": duration == null ? null : duration,
        "picture": picture == null ? null : picture,
        "type": type == null ? null : type,
      };
}
