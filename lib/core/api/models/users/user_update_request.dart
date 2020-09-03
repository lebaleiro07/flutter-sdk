import 'dart:convert';

import 'picture.model.dart';
import 'user_roles.model.dart';

class UserUpdateRequest {
  String name;
  String description;
  String location;
  String phone;
  String idPictureCover;
  String idPictureProfile;

  UserUpdateRequest({
    this.name,
    this.description,
    this.location,
    this.phone,
    this.idPictureCover,
    this.idPictureProfile,
  });

  factory UserUpdateRequest.fromJson(String str) => UserUpdateRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUpdateRequest.fromMap(Map<String, dynamic> json) => new UserUpdateRequest(
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        location: json["location"] == null ? null : json["location"],
        phone: json["phone"] == null ? null : json["phone"],
        idPictureCover:
            json["id_picture_cover"] == null ? null : json["id_picture_cover"],
        idPictureProfile: json["id_picture_profile"] == null
            ? null
            : json["id_picture_profile"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "location": location == null ? null : location,
        "phone": phone == null ? null : phone,
        "id_picture_cover": idPictureCover == null ? null : idPictureCover,
        "id_picture_profile":
            idPictureProfile == null ? null : idPictureProfile,
      };
}
