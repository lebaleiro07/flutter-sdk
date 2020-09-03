import 'dart:convert';

class CreatePostRequest {
  String postName;
  String idMedia;
  String idPicture;
  List<String> idComposers;
  List<String> idInterpreters;
  List<String> idTags;
  String lyrics;
  int acceptedTerms;

  CreatePostRequest({
    this.postName,
    this.idMedia,
    this.idPicture,
    this.idComposers,
    this.idInterpreters,
    this.idTags,
    this.lyrics,
    this.acceptedTerms,
  });

  factory CreatePostRequest.fromJson(String str) =>
      CreatePostRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePostRequest.fromMap(Map<String, dynamic> json) =>
      new CreatePostRequest(
        postName: json["name"] == null ? null : json["name"],
        idMedia: json["id_media"] == null ? null : json["id_media"],
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
        acceptedTerms: json["accepted_terms"] == null
            ? null
            : json["accepted_terms"].runtimeType == int
                ? json["accepted_terms"]
                : (json["accepted_terms"] as double).toInt(),
      );

  Map<String, dynamic> toMap() => {
        "name": postName == null ? null : postName,
        "id_media": idMedia == null ? null : idMedia,
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
        "accepted_terms": acceptedTerms == null ? null : acceptedTerms,
      };
}
