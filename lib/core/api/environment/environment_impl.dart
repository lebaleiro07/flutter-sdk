import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';
import 'package:music_playce_sdk/core/api/exceptions/environment/environment_exceptions.dart';

class EnvironmentImpl implements Environment {
  RemoteConfig _remoteConfig;

  final _keys = <String, String>{};

  @override
  String get(String key) {
    if (!_keys.containsKey(key)) {
      throw EnvironmentException("Unknown environment $key");
    }

    return _keys[key];
  }

  @override
  Future<void> load(String envKey) async {
    print('intializing environment in $envKey');

    if (_remoteConfig == null) {
      _remoteConfig = await RemoteConfig.instance;
    }

    await _remoteConfig.fetch(expiration: const Duration(hours: 24));

    await _remoteConfig.activateFetched();

    final data = _remoteConfig.getString(envKey);

    final map = Map.from(jsonDecode(data)).cast<String, String>();

    _keys.addAll(map);
  }

  void expire() {
    _remoteConfig.dispose();
  }
}