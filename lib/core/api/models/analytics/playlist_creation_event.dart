class PlaylistCreationEvent {
  String userId;
  String name;
  String playlistName;
  String playlistId;

  PlaylistCreationEvent(
      {this.userId, this.name, this.playlistName, this.playlistId});

  PlaylistCreationEvent.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    playlistName = json['playlist_name'];
    playlistId = json['playlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['playlist_name'] = this.playlistName;
    data['playlist_id'] = this.playlistId;
    return data;
  }
}