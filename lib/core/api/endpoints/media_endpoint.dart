import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';

import '../environment/environment.dart';

class MediaEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String getAllMedia = "$_apiHost/v1/media";

}