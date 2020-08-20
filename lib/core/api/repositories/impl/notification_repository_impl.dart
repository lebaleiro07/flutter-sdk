import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../http/music_playce_http.dart';
import '../../endpoints/notification_endpoint.dart';
import '../../models/cursor.dart';
import '../../models/notification/notification.dart';
import '../notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final MusicPlayceHttp httpClient;

  const NotificationRepositoryImpl({@required this.httpClient});

  @override
  Future<List<CentralNotification>> get() async {
    try {
      final response = await httpClient.get(NotificationEndpoint.get);

      final data = jsonDecode(response.body);

      return data
          .map<CentralNotification>(
              (notification) => CentralNotification.fromJson(notification))
          .toList();
    } catch (e, s) {
      print("$e $s");
    }
  }

  @override
  Future<DataWithCursor<CentralNotification>> getById(String notificationId,
      {int page = 8, String cursor}) async {
    final response = await httpClient.get(
        "${NotificationEndpoint.getById(notificationId)}?limit=$page&" +
            (cursor != null ? 'next=$cursor' : ''));

    final data = jsonDecode(response.body)["data"];
    final dataCursor = Cursor.fromMap(jsonDecode(response.body)["cursor"]);

    final List<CentralNotification> notifications = data
        .map<CentralNotification>(
            (notification) => CentralNotification.fromJson(notification))
        .toList();

    final dataWithCursor = DataWithCursor<CentralNotification>(
      data: notifications,
      cursor: dataCursor,
    );

    return dataWithCursor;
  }

  @override
  Future<CentralNotification> update(
      String notificationId, CentralNotification notification) async {
    final response = await httpClient.put(
        NotificationEndpoint.update(notificationId),
        body: notification.toJSON());

    final data = jsonDecode(response.body);

    return CentralNotification.fromJson(data);
  }

  @override
  Future<Response> delete(String notificationId) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
