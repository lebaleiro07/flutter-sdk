import 'dart:convert';

import 'package:music_playce_sdk/core/api/models/users/picture.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_roles.model.dart';

class User {
  String id;
  String name;
  String description;
  String location;
  String phone;
  String infoWebsite;
  String infoFbPage;
  String infoInsta;
  String infoYoutube;
  int indications;
  int indicationsFrom;
  int following;
  int followers;
  bool isFollowing;
  int interpretations;
  int compositions;
  String stripeCustomerId;
  String username;
  String email;
  String password;
  String stripeDefaultPaymentMethod;
  List<String> triedProducts;
  UserRoles role;
  Picture pictureProfile;
  Picture pictureCover;
  DateTime datetimeCreated;
  DateTime datetimeUpdated;
  int score;
  int liked;
  bool deleted;
  int acceptedTerms;
  int acceptedPolicy;
  bool emailConfirmed;

  User({
    this.id,
    this.name,
    this.description,
    this.location,
    this.phone,
    this.infoWebsite,
    this.infoFbPage,
    this.infoInsta,
    this.infoYoutube,
    this.indications,
    this.indicationsFrom,
    this.following,
    this.followers,
    this.interpretations,
    this.compositions,
    this.stripeCustomerId,
    this.username,
    this.email,
    this.password,
    this.stripeDefaultPaymentMethod,
    this.triedProducts,
    this.role,
    this.pictureProfile,
    this.pictureCover,
    this.datetimeCreated,
    this.datetimeUpdated,
    this.score,
    this.liked,
    this.deleted,
    this.acceptedTerms,
    this.acceptedPolicy,
    this.emailConfirmed,
    this.isFollowing,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => new User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        score: json["score"] == null ? null : json["score"],
        phone: json["phone"] == null ? null : json["phone"],
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
        deleted: json["deleted"] == null ? null : json["deleted"],
        datetimeCreated: json["datetime_created"] == null
            ? null
            : DateTime.parse(json["datetime_created"]),
        datetimeUpdated: json["datetime_updated"] == null
            ? null
            : DateTime.parse(json["datetime_updated"]),
        pictureProfile: json["picture_profile"] == null
            ? json["id_picture_profile"] == null
                ? null
                : Picture.fromMap({"_id": json["id_picture_profile"]})
            : Picture.fromMap(json["picture_profile"]),
        pictureCover: json["picture_cover"] == null
            ? json["picture_cover"] == null
                ? null
                : Picture.fromMap({"_id": json["picture_cover"]})
            : Picture.fromMap(json["picture_cover"]),
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        acceptedTerms: json["accepted_terms"] == null
            ? null
            : json["accepted_terms"].runtimeType == int
                ? json["accepted_terms"]
                : (json["accepted_terms"] as double).toInt(),
        acceptedPolicy: json["accepted_policy"] == null
            ? null
            : json["accepted_policy"].runtimeType == int
                ? json["accepted_policy"]
                : (json["accepted_policy"] as double).toInt(),
        emailConfirmed:
            json["email_confirmed"] == null ? null : json["email_confirmed"],
        role: json["role"] == null ? null : UserRoles.fromMap(json["role"]),
        location: json["location"] == null ? null : json["location"],
        followers: json["followers"] == null
            ? null
            : json["followers"].runtimeType == int
                ? json["followers"]
                : (json["followers"] as double).toInt(),
        following: json["following"] == null
            ? null
            : json["following"].runtimeType == int
                ? json["following"]
                : (json["following"] as double).toInt(),
        description: json["description"] == null ? null : json["description"],
        isFollowing:
            json['is_following'] == null ? false : json["is_following"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "score": score == null ? null : score,
        "phone": phone == null ? null : phone,
        "indications": indications == null ? null : indications,
        "indications_from": indicationsFrom == null ? null : indicationsFrom,
        "liked": liked == null ? null : liked,
        "deleted": deleted == null ? null : deleted,
        "datetime_created":
            datetimeCreated == null ? null : datetimeCreated.toIso8601String(),
        "datetime_updated":
            datetimeUpdated == null ? null : datetimeUpdated.toIso8601String(),
        "picture_profile":
            pictureProfile == null ? null : pictureProfile.toMap(),
        "picture_cover": pictureCover == null ? null : pictureCover.toMap(),
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "accepted_terms": acceptedTerms == null ? null : acceptedTerms,
        "accepted_policy": acceptedPolicy == null ? null : acceptedPolicy,
        "email_confirmed": emailConfirmed == null ? null : emailConfirmed,
        "role": role == null ? null : role.toMap(),
        "location": location == null ? null : location,
        "followers": followers == null ? null : followers,
        "following": following == null ? null : following,
        "description": description == null ? null : description,
        "is_following": isFollowing == null ? null : isFollowing,
      };
}
