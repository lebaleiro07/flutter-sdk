import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/users/picture.model.dart';

class UserPictures {
  Picture pictureProfile;
  Picture pictureCover;

  UserPictures({
    this.pictureProfile,
    this.pictureCover,
  });

  factory UserPictures.fromJson(String str) =>
      UserPictures.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPictures.fromMap(Map<String, dynamic> json) => new UserPictures(
        pictureProfile: json["picture_profile"] == null
            ? null
            : Picture.fromMap(json["picture_profile"]),
        pictureCover: json["picture_cover"] == null
            ? null
            : Picture.fromMap(json["picture_cover"]),
      );

  Map<String, dynamic> toMap() => {
        "picture_profile":
            pictureProfile == null ? null : pictureProfile.toMap(),
        "picture_cover": pictureCover == null ? null : pictureCover.toMap(),
      };
}
