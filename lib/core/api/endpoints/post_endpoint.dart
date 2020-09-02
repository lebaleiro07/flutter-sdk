import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';

import '../environment/environment.dart';

class PostEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static final String getAll = "$_apiHost/v2/posts";

  static String indicate(String postId) =>
      "$_apiHost/v1/posts/$postId/indications";

  static String like(String postId) => "$_apiHost/v1/posts/$postId/likes";
}
