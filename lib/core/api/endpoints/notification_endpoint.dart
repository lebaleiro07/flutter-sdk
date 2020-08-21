import 'package:get_it/get_it.dart';

import '../environment.dart';

class NotificationEndpoint {
  static final _env = GetIt.instance<Environment>().apiHost;

  static final get = "$_env/v1/notification";

  static getById(String notificationId) =>
      "$_env/v1/notification/$notificationId";

  static update(String notificationId) =>
      "$_env/v1/notification/$notificationId";
}
