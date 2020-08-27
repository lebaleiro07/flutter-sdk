import 'package:flutter/material.dart';
import '../../../utils/string_util.dart';

class AuthCredentials {
  String password;
  String usernameOrEmail;
  // String deviceToken;

  AuthCredentials({
    @required this.usernameOrEmail,
    @required this.password,
    // @required this.deviceToken
  });

  Map<String, String> toJSON() {
    final Map<String, String> credentialsMap = {
      "email": usernameOrEmail,
      "password": password.hash(),
      // "device_token": deviceToken
    };

    return credentialsMap;
  }
}
