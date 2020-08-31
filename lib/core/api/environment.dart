import 'package:flutter/widgets.dart';

class Environment {
  final String apiHost;
  final String spotifyID;
  final String webSiteLink;

  Environment({@required this.apiHost, @required this.spotifyID, @required this.webSiteLink});

  factory Environment.prod() => Environment(
        apiHost: 'https://api.musicplayce.com',
        spotifyID: '141a8d176925462b96a51556bd5a839b',
        webSiteLink: 'https://www.musicplayce.com'
      );

  factory Environment.dev() => Environment(
        apiHost: 'https://api-beta.musicplayce.com',
        spotifyID: '42ffffab5b9a45289e7b6ede412b3487',
        webSiteLink: 'https://sandbox.musicplayce.com'
      );
}
