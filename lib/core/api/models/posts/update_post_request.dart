import 'dart:convert';

class UpdatePostRequest {
  String postName;
  String idPicture;
  List<String> idComposers;
  List<String> idInterpreters;
  List<String> idTags;
  String lyrics;

  UpdatePostRequest({
    this.postName,
    this.idPicture,
    this.idComposers,
    this.idInterpreters,
    this.idTags,
    this.lyrics,
  });

  factory UpdatePostRequest.fromJson(String str) =>
      UpdatePostRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePostRequest.fromMap(Map<String, dynamic> json) =>
      new UpdatePostRequest(
        postName: json["name"] == null ? null : json["name"],
        idPicture: json["id_picture"] == null ? null : json["id_picture"],
        idComposers: json["id_composers"] == null
            ? null
            : List<String>.from(json["id_composers"].map((x) => x)),
        idInterpreters: json["id_interpreters"] == null
            ? null
            : List<String>.from(json["id_interpreters"].map((x) => x)),
        idTags: json["id_tags"] == null
            ? null
            : List<String>.from(json["id_tags"].map((x) => x)),
        lyrics: json["lyrics"] == null ? null : json["lyrics"],
      );

  Map<String, dynamic> toMap() => {
    "name": postName == null ? null : postName,
    "id_picture": idPicture == null ? null : idPicture,
    "id_composers": idComposers == null
        ? null
        : List<String>.from(idComposers.map((x) => x)),
    "id_interpreters": idInterpreters == null
        ? null
        : List<String>.from(idInterpreters.map((x) => x)),
    "id_tags":
    idTags == null ? null : List<String>.from(idTags.map((x) => x)),
    "lyrics": lyrics == null ? null : lyrics,
  };
}
