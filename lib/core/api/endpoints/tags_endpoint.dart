import 'package:get_it/get_it.dart';

import '../environment.dart';

class TagsEndpoint {
  static final _env = GetIt.instance<Environment>();

  static String getAllTags({int limit = 12}) =>
      '${_env.apiHost}/v1/tags/?limit=$limit';

  static String getTagById(String tagId) => '${_env.apiHost}/v2/tags/$tagId';

  static String followTag(String tagId) =>
      '${_env.apiHost}/v2/tags/$tagId/follow';

  static String getAllPostsByTagId(String tagId) =>
      '${_env.apiHost}/v1/tags/$tagId/posts';
}
