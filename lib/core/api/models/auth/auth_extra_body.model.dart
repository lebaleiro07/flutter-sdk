import 'package:flutter/cupertino.dart';

class AuthExtraBody {
  Map<String, dynamic> extras;

  AuthExtraBody({ @required this.extras });

  AuthExtraBody.fromJson(Map<String, dynamic> data){
    extras = data != null ? data : null;
  }
}