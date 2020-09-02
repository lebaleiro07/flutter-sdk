import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';

class PlacesEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String getStates = "$_apiHost/v1/places/";

  static String getCities(String stateId) =>
      "$_apiHost/v1/places/$stateId";
}
