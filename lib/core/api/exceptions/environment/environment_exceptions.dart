class EnvironmentException implements Exception {
  final String message;

  EnvironmentException(this.message);

  @override
  String toString() => message;
}