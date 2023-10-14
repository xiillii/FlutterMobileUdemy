class ConnectionTimeout implements Exception {}

class ConnectionError implements Exception {}

class WrongCredentials implements Exception {}

class InvalidToken implements Exception {}

class CustomError implements Exception {
  final String message;
  final int errorCode;

  CustomError({required this.message, required this.errorCode});
}
