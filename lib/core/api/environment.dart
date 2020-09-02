import 'package:flutter/widgets.dart';

class Environment {
  final String apiHost;
  final String dynamicLinkPrefix;
  final String spotifyID;
  final String webSiteLink;
  final String webDashLink;
  final String iOSIntercomKey;
  final String androidIntercomKey;
  final String appIDIntercom;

  const Environment(
      {@required this.apiHost,
      @required this.dynamicLinkPrefix,
      @required this.spotifyID,
      @required this.webSiteLink,
      @required this.webDashLink,
      @required this.iOSIntercomKey,
      @required this.androidIntercomKey,
      @required this.appIDIntercom});

  factory Environment.prod() => Environment(
      apiHost: 'https://api.musicplayce.com',
      dynamicLinkPrefix: 'https://open.musicplayce.com/fdl',
      spotifyID: '141a8d176925462b96a51556bd5a839b',
      webSiteLink: 'https://www.musicplayce.com',
      webDashLink: 'https://dashboard.musicplayce.com',
      iOSIntercomKey: 'ios_sdk-055cfa4e053bff4617a46cee409b358c2a1ecf2f',
      androidIntercomKey:
          'android_sdk-ca180bdc03bb1dd031a04a044c803118681ee064',
      appIDIntercom: 'byo6j7o1');
  factory Environment.dev() => Environment(
      apiHost: 'https://api-beta.musicplayce.com',
      dynamicLinkPrefix: 'https://musicplayce.page.link',
      spotifyID: '42ffffab5b9a45289e7b6ede412b3487',
      webSiteLink: 'https://sandbox.musicplayce.com',
      webDashLink: 'https://dashboard-sandbox.musicplayce.com',
      iOSIntercomKey: 'ios_sdk-f89bc4dce1f127d8a65b36e18dcbbc5baf53b907',
      androidIntercomKey:
          'android_sdk-516e7d257ee2d4b98bf801c146e6c5c92c5a77e5',
      appIDIntercom: 'xypa8ezx');
}
