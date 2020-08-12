class PaymentRequiredException implements Exception {
  final String message;

  const PaymentRequiredException(this.message);

  @override
  String toString() => message;
}