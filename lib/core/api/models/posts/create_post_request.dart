import 'dart:convert';

class CreatePostRequest {
  String postName;
  String idMedia;
  String idPicture;
  List<String> idComposers;
  List<String> idInterpreters;
  List<String> idRelatedArtists;
  List<String> idTags;
  List<String> idGenres;
  String lyrics;
  int acceptedTerms;

  CreatePostRequest({
    this.postName,
    this.idMedia,
    this.idPicture,
    this.idComposers,
    this.idInterpreters,
    this.idRelatedArtists,
    this.idTags,
    this.idGenres,
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
        idRelatedArtists: json["id_related_artists"] == null
            ? null
            : List<String>.from(json["id_related_artists"].map((x) => x)),
        idTags: json["id_tags"] == null
            ? null
            : List<String>.from(json["id_tags"].map((x) => x)),
        idGenres: json["id_genres"] == null
            ? null
            : List<String>.from(json["id_genres"].map((x) => x)),
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
            : jsonEncode(idComposers),
        "id_interpreters": idInterpreters == null
            ? null
            : jsonEncode(idInterpreters),
        "id_related_artists":
            idRelatedArtists == null ? null : jsonEncode(idRelatedArtists),
        "id_tags":
            idTags == null ? null : jsonEncode(idTags),
        "id_genres": idGenres == null ? null : jsonEncode(idGenres),
        "lyrics": lyrics == null ? null : lyrics,
        "accepted_terms": acceptedTerms == null ? null : acceptedTerms,
      };
}
