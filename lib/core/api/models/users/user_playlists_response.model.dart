import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/posts/picture.model.dart';

class UserPlaylists {
  String idPlaylist;
  String idProfile;
  String playlistName;
  int duration;
  int length;
  bool isEditable;
  bool isPublic;
  Picture picture;

  UserPlaylists({
    this.idPlaylist,
    this.idProfile,
    this.playlistName,
    this.duration,
    this.length,
    this.isEditable,
    this.isPublic,
    this.picture,
  });

  factory UserPlaylists.fromJson(String str) =>
      UserPlaylists.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPlaylists.fromMap(Map<String, dynamic> json) => new UserPlaylists(
        idPlaylist: json['_id'] == null ? null : json['_id'],
        idProfile: json['id_profile'] == null ? null : json['id_profile'],
        playlistName: json['name'] == null ? null : json['name'],
        duration:
            json['duration'].toInt() == null ? null : json['duration'].toInt(),
        length: json['length'] == null ? null : json['length'],
        isEditable: json['is_editable'] == null ? null : json['is_editable'],
        isPublic: json['is_public'] == null ? null : json['is_public'],
        picture: json['picture'] == null ? null : json['picture'],
      );

  Map<String, dynamic> toMap() => {
        "_id": idPlaylist == null ? null : idPlaylist,
        "id_profile": idProfile == null ? null : idProfile,
        "name": playlistName == null ? null : playlistName,
        "duration": duration == null ? null : duration,
        "length": length == null ? null : length,
        "is_editable": isEditable == null ? null : isEditable,
        "is_public": isPublic == null ? null : isPublic,
        "picture": picture == null ? null : picture,
      };

}
