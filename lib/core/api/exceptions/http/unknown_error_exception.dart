class UnknownErrorException implements Exception {
  final String message;

  const UnknownErrorException(this.message);

  @override
  String toString() => message;
}