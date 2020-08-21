import 'dart:convert';

class Meta {
  int size;
  List<String> tagTypes;
  bool lossless;
  String container;
  String codec;
  int sampleRate;
  int numberOfChannels;
  double bitrate;
  String codecProfile;
  int numberOfSamples;
  double duration;

  Meta({
    this.size,
    this.tagTypes,
    this.lossless,
    this.container,
    this.codec,
    this.sampleRate,
    this.numberOfChannels,
    this.bitrate,
    this.codecProfile,
    this.numberOfSamples,
    this.duration,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        size: json["size"] == null ? null : json["size"],
        tagTypes: json["tagTypes"] == null
            ? null
            : List<String>.from(json["tagTypes"].map((x) => x)),
        lossless: json["lossless"] == null ? null : json["lossless"],
        container: json["container"] == null ? null : json["container"],
        codec: json["codec"] == null ? null : json["codec"],
        sampleRate:
            json["sampleRate"] == null ? null : json["sampleRate"].round(),
        numberOfChannels:
            json["numberOfChannels"] == null ? null : json["numberOfChannels"],
        bitrate: json["bitrate"] == null ? null : json["bitrate"].toDouble(),
        codecProfile:
            json["codecProfile"] == null ? null : json["codecProfile"],
        numberOfSamples:
            json["numberOfSamples"] == null ? null : json["numberOfSamples"],
        duration: json["duration"] == null ? null : json["duration"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "size": size == null ? null : size,
        "tagTypes": tagTypes == null
            ? null
            : List<dynamic>.from(tagTypes.map((x) => x)),
        "lossless": lossless == null ? null : lossless,
        "container": container == null ? null : container,
        "codec": codec == null ? null : codec,
        "sampleRate": sampleRate == null ? null : sampleRate,
        "numberOfChannels": numberOfChannels == null ? null : numberOfChannels,
        "bitrate": bitrate == null ? null : bitrate,
        "codecProfile": codecProfile == null ? null : codecProfile,
        "numberOfSamples": numberOfSamples == null ? null : numberOfSamples,
        "duration": duration == null ? null : duration,
      };
}
