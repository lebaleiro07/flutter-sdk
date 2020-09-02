import 'package:get_it/get_it.dart';

import '../environment/environment.dart';

class SearchEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String search = "$_apiHost/v1/search";
}
