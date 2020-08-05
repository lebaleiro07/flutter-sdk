
import 'dart:convert';

class Links {
  String youtube;
  String spotify;
  String deezer;
  String appleMusic;
  String playMusic;
  String tidal;
  String soundcloud;
  String youtubeMusic;

  Links({
    this.youtube,
    this.spotify,
    this.deezer,
    this.appleMusic,
    this.playMusic,
    this.tidal,
    this.soundcloud,
    this.youtubeMusic,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) =>
      Links(
        youtube: json["youtube"] == null ? null : json["youtube"],
        spotify: json["spotify"] == null ? null : json["spotify"],
        deezer: json["deezer"] == null ? null : json["deezer"],
        appleMusic: json["apple_music"] == null ? null : json["apple_music"],
        playMusic: json["play_music"] == null ? null : json["play_music"],
        tidal: json["tidal"] == null ? null : json["tidal"],
        soundcloud: json["soundcloud"] == null ? null : json["soundcloud"],
        youtubeMusic:
        json["youtube_music"] == null ? null : json["youtube_music"],
      );

  Map<String, dynamic> toMap() =>
      {
        "youtube": youtube == null ? null : youtube,
        "spotify": spotify == null ? null : spotify,
        "deezer": deezer == null ? null : deezer,
        "apple_music": appleMusic == null ? null : appleMusic,
        "play_music": playMusic == null ? null : playMusic,
        "tidal": tidal == null ? null : tidal,
        "soundcloud": soundcloud == null ? null : soundcloud,
        "youtube_music": youtubeMusic == null ? null : youtubeMusic,
      };
}