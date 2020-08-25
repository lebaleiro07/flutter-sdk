import 'package:get_it/get_it.dart';

import '../environment.dart';

class TagsEndpoint {
  static final _env = GetIt.instance<Environment>();

  static final String getAllTags = '${_env.apiHost}/v1/tags/';

  static String getTagById(String tagId) => '${_env.apiHost}/v2/tags/$tagId';

  static String followTag(String tagId) =>
      '${_env.apiHost}/v2/tags/$tagId/follow';

  static String getAllPostsByTagId(String tagId, [limit = 5]) =>
      '${_env.apiHost}/v1/tags/$tagId/posts?limit=$limit';
}
