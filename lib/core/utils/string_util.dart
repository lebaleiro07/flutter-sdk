import 'dart:convert';

import 'package:crypto/crypto.dart';

extension StringUtil on String {
  String hash(){
    List<int> bytes = utf8.encode(this);
    return sha256.convert(bytes).toString();
  }
}