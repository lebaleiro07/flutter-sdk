import 'package:get_it/get_it.dart';

import '../environment.dart';

class MediaEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String uploadMedia = "${_env.apiHost}/v1/media";

}