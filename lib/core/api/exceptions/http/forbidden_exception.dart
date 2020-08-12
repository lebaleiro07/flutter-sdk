class ForbiddenException implements Exception {
  final String message;

  const ForbiddenException(this.message);

  @override
  String toString() => message;
}