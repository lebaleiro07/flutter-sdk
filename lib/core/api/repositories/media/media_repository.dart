import 'package:music_playce_sdk/core/api/endpoints/media_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/cursor.dart';
import 'package:music_playce_sdk/core/api/models/media/draft.model.dart';
import 'package:music_playce_sdk/core/api/models/posts/media.model.dart';

/// The abstract class for MediaRepository
///
/// The subclasses need to implement his methods
/// in order to communicate with the user endpoints
abstract class MediaRepository {
  /// Sends an HTTP request to the media endpoint in order to
  /// get all media unpublished send by a user
  /// it represents all user's drafts
  ///
  /// The request is made to [MediaEndpoint.getAllDrafts]
  ///
  /// It returns a [Draft] object
  Future<DataWithCursor<Draft>> getAllDrafts(
      {String userId, int limit = 8, String page});

  Future<Media> getMediaById(String mediaId);

}
