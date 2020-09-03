abstract class Environment {
  Future<void> load(String envKey);
  
  String get(String key);
  
  void expire();
}

class EnvironmentKeys {
  static const String devKeys = 'dev_apiKeys';

  static const String prodKeys = 'prod_apiKeys';

  static const String apiHost = 'apiHost';

  static const String dynamicLinkPrefix = 'dynamicLinkPrefix';

  static const String spotifyID = 'spotifyID';

  static const String webSiteLink = 'webSiteLink';

  static const String webDashLink = 'webDashLink';

  static const String iOSIntercomKey = 'iOSIntercomKey';

  static const String androidIntercomKey = 'androidIntercomKey';
  
  static const String appIDIntercom = 'appIDIntercom';
}