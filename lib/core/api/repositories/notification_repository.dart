import 'dart:async';

import 'package:http/http.dart';

import '../models/cursor.dart';
import '../models/notification/notification.dart';

/// Abstract class that defines a [NotificationRepository]
abstract class NotificationRepository {
  /// Delete a notification
  ///
  /// It receive a [String] that is a [notificationId]
  /// of the notification that will be deleted
  /// It returns a [Response] object
  Future<Response> delete(String notificationId);

  /// Updates a notification
  ///
  /// It receive a [String] that is a [notificationId] and
  /// the [CentralNotification] object with the updated data
  /// It returns a [CentralNotification] object, that is the
  /// updated object
  Future<CentralNotification> update(
      String notificationId, CentralNotification notification);

  /// Fetch all notifications
  ///
  /// It returns a [List] of [CentralNotification]
  /// objects
  Future<List<CentralNotification>> get();

  /// Fetch all notifications by its id
  ///
  /// The id can be the userId, postId or the
  /// notificationId
  /// You can also paginates the response by passing
  /// a [int] and you can access the next page by passing
  /// a [String] that is the [cursor] for the next page
  /// It returns a [DataWithCursor] with a [Cursor] and
  /// a [CentralNotification] object
  Future<DataWithCursor<CentralNotification>> getById(String notificationId,
      {int page = 8, String cursor});
}
