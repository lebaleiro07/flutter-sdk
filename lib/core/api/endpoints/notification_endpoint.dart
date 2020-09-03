import 'package:get_it/get_it.dart';

import '../environment/environment.dart';

class NotificationEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static final get = "$_env/v1/notification";

  static getById(String notificationId) =>
      "$_apiHost/v1/notification/$notificationId";

  static update(String notificationId) =>
      "$_apiHost/v1/notification/$notificationId";
}
