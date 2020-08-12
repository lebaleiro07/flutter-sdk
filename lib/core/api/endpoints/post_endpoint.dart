import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';

class PostEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final String getAll = "${_env.apiHost}/v2/posts";

  static String indicate(String postId) 
    => "${_env.apiHost}/v1/posts/$postId/indications";
}
