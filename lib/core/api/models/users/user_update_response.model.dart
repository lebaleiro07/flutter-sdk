import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/posts/meta.model.dart';
import 'package:music_playce_sdk/core/api/models/users/picture.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_roles.model.dart';

class UserUpdateResponse {
  String id;
  String idUser;
  String name;
  String description;
  String location;
  String phone;
  String idPictureProfile;
  String idPictureCover;
  List<String> searchable;
  String infoWebsite;
  String infoFbPage;
  String infoInsta;
  String infoYoutube;
  int indications;
  int indicationsFrom;
  int liked;
  int following;
  int followers;
  int interpretations;
  int compositions;
  Meta meta;
  String stripeCustomerId;
  List<String> stripePaymentMethods;
  bool deleted;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  String idProfile;

  UserUpdateResponse({
    this.id,
    this.idUser,
    this.name,
    this.description,
    this.location,
    this.phone,
    this.idPictureProfile,
    this.idPictureCover,
    this.searchable,
    this.infoWebsite,
    this.infoFbPage,
    this.infoInsta,
    this.infoYoutube,
    this.indications,
    this.indicationsFrom,
    this.liked,
    this.following,
    this.followers,
    this.interpretations,
    this.compositions,
    this.meta,
    this.stripeCustomerId,
    this.stripePaymentMethods,
    this.deleted,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.idProfile,
  });

  factory UserUpdateResponse.fromJson(String str) =>
      UserUpdateResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUpdateResponse.fromMap(Map<String, dynamic> json) =>
      new UserUpdateResponse(
        id: json["_id"] == null ? null : json["_id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        location: json["location"] == null ? null : json["location"],
        phone: json["phone"] == null ? null : json["phone"],
        idPictureProfile: json["id_picture_profile"] == null
            ? null
            : json["id_picture_profile"],
        idPictureCover:
            json["id_picture_cover"] == null ? null : json["id_picture_cover"],
        searchable: json["searchable"] == null
            ? null
            : List<String>.from(json["searchable"].map((x) => x)),
        infoWebsite: json["info_website"] == null ? null : json["info_website"],
        infoFbPage: json["info_fb_page"] == null ? null : json["info_fb_page"],
        infoInsta: json["info_insta"] == null ? null : json["info_insta"],
        infoYoutube: json["info_youtube"] == null ? null : json["info_youtube"],
        indications: json["indications"] == null
            ? null
            : json["indications"].runtimeType == int
                ? json["indications"]
                : (json["indications"] as double).toInt(),
        indicationsFrom: json["indications_from"] == null
            ? null
            : json["indications_from"].runtimeType == int
                ? json["indications_from"]
                : (json["indications_from"] as double).toInt(),
        liked: json["liked"] == null
            ? null
            : json["liked"].runtimeType == int
                ? json["liked"]
                : (json["liked"] as double).toInt(),
        following: json["following"] == null
            ? null
            : json["following"].runtimeType == int
                ? json["following"]
                : (json["following"] as double).toInt(),
        followers: json["followers"] == null
            ? null
            : json["followers"].runtimeType == int
                ? json["followers"]
                : (json["followers"] as double).toInt(),
        interpretations: json["interpretations"] == null
            ? null
            : json["interpretations"].runtimeType == int
                ? json["interpretations"]
                : (json["interpretations"] as double).toInt(),
        compositions: json["compositions"] == null
            ? null
            : json["compositions"].runtimeType == int
                ? json["compositions"]
                : (json["compositions"] as double).toInt(),
        meta: json['meta'] == null ? null : Meta.fromMap(json['meta']),
        stripeCustomerId: json["stripe_customer_id"] == null
            ? null
            : json["stripe_customer_id"],
        stripePaymentMethods: json["stripe_payment_methods"] == null
            ? null
            : List<String>.from(json["stripe_payment_methods"].map((x) => x)),
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
        idProfile: json["id_profile"] == null ? null : json["id_profile"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "id_user": idUser == null ? null : idUser,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "location": location == null ? null : location,
        "phone": phone == null ? null : phone,
        "id_picture_profile":
            idPictureProfile == null ? null : idPictureProfile,
        "id_picture_cover": idPictureCover == null ? null : idPictureCover,
        "searchable": searchable == null
            ? null
            : List<String>.from(searchable.map((x) => x)),
        "info_website": infoWebsite == null ? null : infoWebsite,
        "info_fb_page": infoFbPage == null ? null : infoFbPage,
        "info_insta": infoInsta == null ? null : infoInsta,
        "info_youtube": infoYoutube == null ? null : infoYoutube,
        "indications": indications == null ? null : indications,
        "indications_from": indicationsFrom == null ? null : indicationsFrom,
        "liked": liked == null ? null : liked,
        "following": following == null ? null : following,
        "followers": followers == null ? null : followers,
        "interpretations": interpretations == null ? null : interpretations,
        "compositions": compositions == null ? null : compositions,
        "meta": meta == null ? null : meta.toMap(),
        "stripe_customer_id":
            stripeCustomerId == null ? null : stripeCustomerId,
        "stripe_payment_methods": stripePaymentMethods == null
            ? null
            : List<String>.from(stripePaymentMethods.map((x) => x)),
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
        "id_profile": idProfile == null ? null : idProfile,
      };
}
