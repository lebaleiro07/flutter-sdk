class TooManyRequestsException implements Exception {
  final String message;

  const TooManyRequestsException(this.message);

  @override
  String toString() => message;
}