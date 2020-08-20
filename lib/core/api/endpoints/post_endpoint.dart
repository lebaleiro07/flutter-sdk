import 'package:get_it/get_it.dart';

import '../environment.dart';

class PostEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final String getAll = "${_env.apiHost}/v2/posts";

  static String indicate(String postId) =>
      "${_env.apiHost}/v1/posts/$postId/indications";

  static String like(String postId) => "${_env.apiHost}/v1/posts/$postId/likes";
}
