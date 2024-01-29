class ServerFailureException implements Exception {
  ServerFailureException(this.message, {this.responseStatusCode});

  final String? message;
  int? responseStatusCode;
}
