import 'package:music_playce_sdk/core/api/endpoints/user_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/users/user_follow_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_likes_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_playlists_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_response.model.dart';

import '../models/cursor.dart';
import '../models/users/user_playlists_response.model.dart';

/// The abstract class for UserRepository
///
/// The subclasses need to implement his methods
/// in order to communicate with the user endpoints
abstract class UserRepository {
  /// Sends an HTTP request to the user endpoint in order to
  /// fetch a specific user by his ID
  ///
  /// The request is made to [UserEndpoint.getUser]
  /// It receive a [String] that is a [userId]
  ///
  /// It returns a [User] object
  Future<User> getUser(String userId);

  /// Sends an HTTP request to the user endpoint in order to
  /// update a specific user by his ID
  ///
  /// The request is made to [UserEndpoint.updateUser]
  /// It receive a [User] that contains the new
  /// content and the [userId]
  ///
  /// It returns a [User] object, that is the
  /// updated object
  Future<User> updateUser(User user);

  /// Sends a HTTP request to the user endpoint in order to
  /// get all user's likes by his ID
  ///
  /// The request is made to [UserEndpoint.getUserLikes]
  /// It receive a [String] that is a [userId]
  ///
  /// It returns a [User] object
  Future<UserLikesResponse> getUserLikes(String userId);

  /// Sends an HTTP request to the user endpoint in order to
  /// follow a specific user by his ID
  ///
  /// The request is made to [UserEndpoint.followUser]
  /// It receive a [String] that is a [userId]
  ///
  /// It returns a [UserFollowResponse] object
  Future<UserFollowResponse> followUser(String userId);

  /// Sends an HTTP request to the user endpoint in order to
  /// unfollow a specific user by his ID
  ///
  /// The request is made to [UserEndpoint.unfollowUser]
  /// It receive a [String] that is a [userId]
  ///
  /// It returns a [UserFollowResponse] object
  Future<UserFollowResponse> unfollowUser(String userId);

  /// Sends an HTTP request to the user endpoint in order to
  /// get all playlists from a specific user by his ID
  ///
  /// The request is made to [UserEndpoint.getAllUserPlaylists]
  /// It receive a [String] that is a [userId]
  ///
  /// It returns a [UserPlaylistsResponse] object
  Future<DataWithCursor<UserPlaylistsResponse>> getAllUserPlaylists(String userId);
}
