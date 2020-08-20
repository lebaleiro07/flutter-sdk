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
      return json['data']['code'];
    }

    return null;
  }

  String get code => _parsedCode;

  @override
  String toString() => message;
}
