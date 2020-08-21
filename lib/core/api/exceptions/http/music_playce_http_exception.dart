abstract class MusicPlayceException implements Exception {
  final String message;
  final dynamic json;

  const MusicPlayceException(this.message, { dynamic json }) : json = json;

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

  String get code => _parsedCode;

  @override
  String toString() => message;
}