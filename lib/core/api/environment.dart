import 'package:flutter/widgets.dart';

class Environment {
  final String apiHost;
  final String spotifyID;

  Environment({@required this.apiHost, @required this.spotifyID});

  factory Environment.prod() => Environment(
        apiHost: 'https://api.musicplayce.com',
        spotifyID: '141a8d176925462b96a51556bd5a839b',
      );

  factory Environment.dev() => Environment(
        apiHost: 'https://api-beta.musicplayce.com',
        spotifyID: '42ffffab5b9a45289e7b6ede412b3487',
      );
}
