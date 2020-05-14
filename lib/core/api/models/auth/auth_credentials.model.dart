import 'package:flutter/material.dart';

class AuthCredentials {
  String password;
  String usernameOrEmail;
  String deviceToken;

  AuthCredentials({
    @required this.usernameOrEmail,
    @required this.password,
    @required this.deviceToken
  });

  Map<String, String> toJSON(){
    final Map<String, String> credentialsMap = {
      "username": usernameOrEmail,
      "password": password,
      "device_token": deviceToken
    };

    return credentialsMap;
  }
}