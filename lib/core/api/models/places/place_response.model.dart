import 'dart:convert';

class PlaceResponse {
  String idPlace;
  String placeName;

  PlaceResponse({
    this.idPlace,
    this.placeName,
  });

  factory PlaceResponse.fromJson(String str) =>
      PlaceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceResponse.fromMap(Map<String, dynamic> json) =>
      new PlaceResponse(
        idPlace: json["_id"] == null ? null : json["_id"],
        placeName: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_id": idPlace == null ? null : idPlace,
        "name": placeName == null ? null : placeName,
      };
}