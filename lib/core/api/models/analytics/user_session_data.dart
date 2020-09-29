import 'package:flutter/cupertino.dart';
import 'package:music_playce_sdk/core/api/models/users/user_response.model.dart';

class UserSessionData {
  static UserSessionData _instance = UserSessionData._();
  
  User user;
  int postsViewedQuantity;
  int playQuantity;
  int indicationQuantity;
  int pollsCreated;
  int postsCreated;
  String _eventName = 'session_begin';

  UserSessionData._({
    @required this.user,
    this.postsViewedQuantity = 0,
    this.playQuantity = 0,
    this.indicationQuantity = 0,
    this.pollsCreated = 0,
    this.postsCreated = 0
  });

  static UserSessionData get instance => _instance;

  Map<String, dynamic> toMap(){
    return {
      'user_id': user.id,
      'name': user.name,
      'play_quantity': playQuantity,
      'posts_viewed_quantity': postsViewedQuantity,
      'indication_quantity': indicationQuantity,
      'polls_created': pollsCreated,
      'posts_created': postsCreated
    };
  }
}