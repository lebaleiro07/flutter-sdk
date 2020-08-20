import '../posts/posts.model.dart';

class PlaylistResponse {
  String idPlaylist;
  String idProfile;
  String playlistName;
  String description;
  String idPicture;
  bool isPublic;
  bool isEditable;
  bool visible;
  String typeSource;
  int length;
  int duration;
  List<Post> posts;

  PlaylistResponse({
    this.idPlaylist,
    this.idProfile,
    this.playlistName,
    this.description,
    this.idPicture,
    this.isPublic,
    this.isEditable,
    this.visible,
    this.typeSource,
    this.length,
    this.duration,
    this.posts,
  });

  Map<String, dynamic> toJson() {
    return {
      "_id": idPlaylist,
      "id_profile": idProfile,
      "name": playlistName,
      "description": description,
      "id_picture": idPicture,
      "is_public": isPublic,
      "is_editable": isEditable,
      "visible": visible,
      "type_source": typeSource,
      "length": length,
      "duration": duration,
      "posts": posts != null ? posts.map((e) => e.toMap()) : null,
    };
  }

  factory PlaylistResponse.fromJson(dynamic data) {
    return PlaylistResponse(
        idPlaylist: data['_id'],
        idProfile: data['id_profile'],
        playlistName: data['name'],
        description: data['description'],
        idPicture: data['id_picture'],
        isPublic: data['is_public'],
        isEditable: data['is_editable'],
        visible: data['visible'],
        typeSource: data['type_source'],
        length: data['length'],
        duration: data['duration']?.toInt(),
        posts: data['posts'] != null
            ? data['posts'].map<Post>((post) {
                return Post.fromMap(post);
              }).toList()
            : null);
  }
}
