import 'package:dartz/dartz.dart';
import 'package:music_playce_sdk/core/api/endpoints/user_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/users/term.dart';
import 'package:music_playce_sdk/core/api/models/users/user_follow_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_likes_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_playlists_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_response.model.dart';
import 'package:music_playce_sdk/core/api/models/users/user_update_response.model.dart';

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
  /// It returns a [UserUpdateResponse] object, that is the
  /// updated object
  Future<UserUpdateResponse> updateUser(User user);

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
  /// It receive a [String] that is a [userId] and a [String]
  /// [limit] to determine the number of results per page
  ///
  /// This will return all user's playlists in a [DataWithCursor] format
  Future<DataWithCursor<UserPlaylists>> getAllUserPlaylists({String userId, String page, int limit = 12 });

  Future<Either<Exception, List<User>>> search(String query, { int limit = 5 });

  Future<Either<Exception, dynamic>> checkEmail(String email);

  Future<Either<Exception, dynamic>> checkPhone(String phone);

  Future<Either<Exception, Term>> getTerm(String name);

  Future<Either<Exception, List<Term>>> getAllTerms();
}
