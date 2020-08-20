class MusicPlayceHttpStatus {
  static const int badRequest = 400;

  static const int clientError = 401;

  static const int unauthorized = 401;

  static const int paymentRequired = 402;

  static const int forbidden = 403;

  static const int notFound = 404;

  static const int conflict = 409;

  static const int unprocessableEntity = 422;

  static const int tooManyRequest = 429;

  static const int unknownError = 500;
}

class HttpExceptionCodes {
  static const String badRequest = "error__bad-request";

  static const String clientError = "error__client";

  static const String unauthorized = "error__unauthorized";

  static const String paymentRequired = "error__payment";

  static const String forbidden = "error__forbidden";

  static const String notFound = "error__not-found";

  static const String conflict = "error__conflict";

  static const String unprocessableEntity = "error__unprocessable-entity";

  static const String tooManyRequest = "error__many-request";

  static const String unknownError = "error__unknown";
}
