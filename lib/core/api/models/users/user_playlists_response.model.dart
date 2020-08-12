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

  Map<String, dynamic> toJson() {
    return {
      "_id": idPlaylist,
      "id_profile": idProfile,
      "name": playlistName,
      "duration": duration,
      "length": length,
      "is_editable": isEditable,
      "is_public": isPublic,
      "picture": picture
    };
  }

  factory UserPlaylists.fromJson(dynamic data) {
    return UserPlaylists(
      idPlaylist: data['_id'],
      idProfile: data['id_profile'],
      playlistName: data['name'],
      duration: data['duration'].toInt(),
      length: data['length'],
      isEditable: data['is_editable'],
      isPublic: data['is_public'],
      picture: data['picture'],
    );
  }
}