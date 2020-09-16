import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';

import '../environment/environment.dart';

class MediaEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final _apiHost = _env.get(EnvironmentKeys.apiHost);

  static String getAllDrafts(String userId) =>
      "$_apiHost/v1/media/drafts/$userId";

  static String getMediaById(String mediaId) => "$_apiHost/v1/media/$mediaId";

  static String deleteAMedia(String mediaId) => "$_apiHost/v1/media/$mediaId";
}