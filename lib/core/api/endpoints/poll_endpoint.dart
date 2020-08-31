import 'package:get_it/get_it.dart';

import '../environment.dart';

class PollEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String create = "${_env.apiHost}/v1/polls";
}
