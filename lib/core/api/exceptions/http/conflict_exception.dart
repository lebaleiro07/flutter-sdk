class ConflictException implements Exception {
  final String message;

  const ConflictException(this.message);

  @override
  String toString() => message;
}