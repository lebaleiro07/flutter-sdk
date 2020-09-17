abstract class MusicPlayceException implements Exception {
  final String message;
  final dynamic json;

  const MusicPlayceException(this.message, {dynamic json}) : json = json;

  String get _parsedCode {
    print(json);
    if (json.containsKey('error')) {
      if (json['error'].containsKey('code')) {
        return json['error']['code'];
      }
    } else if (json.containsKey('data')) {
      if (json['data'].containsKey('code')) {
        return json['data']['code'];
      } else if (json['data'].containsKey('message')) {
        return json['data']['message']['code'];
      }
    }

    return null;
  }

  String get _parsedMessage {
    if (json.containsKey('error')) {
      if (json['error'].containsKey('message')) {
        return json['error']['message'];
      }
    } else if (json.containsKey('data')) {
      if (json['data'].containsKey('message')) {
        return json['data']['message'];
      } else if (json['data'].containsKey('message')) {
        return json['data']['message']['code'];
      }
    }

    return null;
  }

  String get code => _parsedCode;

  String get info => _parsedMessage;

  @override
  String toString() => message;
}
