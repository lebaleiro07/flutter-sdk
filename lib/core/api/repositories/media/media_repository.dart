import 'package:music_playce_sdk/core/api/endpoints/media_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/media/create_media_response.dart';
import 'package:music_playce_sdk/core/api/models/posts/media.model.dart';

/// The abstract class for MediaRepository
///
/// The subclasses need to implement his methods
/// in order to communicate with the user endpoints
abstract class MediaRepository {
  /// Sends an HTTP request to the media endpoint in order to
  /// upload a media
  ///
  /// The request is made to [MediaEndpoint.uploadMedia]
  /// It receive a [Media] object
  ///
  /// It returns a [MediaResponse] object
  Future<CreateMediaResponse> uploadMedia(Media media);

}
