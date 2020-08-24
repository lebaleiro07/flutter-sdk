import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';

class PlacesEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String getStates = "${_env.apiHost}/v1/places/";

  static String getCities(String stateId) =>
      "${_env.apiHost}/v1/places/$stateId";
}
