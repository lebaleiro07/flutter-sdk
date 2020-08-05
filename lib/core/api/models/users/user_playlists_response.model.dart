import 'package:music_playce_sdk/core/api/models/posts/picture.model.dart';

class UserPlaylistsResponse {
  String idPlaylist;
  String idProfile;
  String playlistName;
  int duration;
  int length;
  bool isEditable;
  bool isPublic;
  Picture picture;

  UserPlaylistsResponse({
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

  factory UserPlaylistsResponse.fromJson(dynamic data) {
    return UserPlaylistsResponse(
      idPlaylist: data['_id'],
      idProfile: data['id_profile'],
      playlistName: data['name'],
      duration: data['duration'],
      length: data['length'],
      isEditable: data['is_editable'],
      isPublic: data['is_public'],
      picture: data['picture'],
    );
  }
}