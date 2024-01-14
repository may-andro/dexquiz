sealed class RemoteApiException implements Exception {
  const RemoteApiException(this.cause, this.stackTrace);

  final Object cause;
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'RemoteApiException($runtimeType): $cause';
  }
}

/// Thrown when error is in the network layer.
class ApiNetworkException extends RemoteApiException {
  ApiNetworkException(Object cause, StackTrace stackTrace)
      : super(cause, stackTrace);
}

/// Thrown when the user is not properly authenticated.
class ApiAuthenticationException extends RemoteApiException {
  ApiAuthenticationException(
      this.errorMessage, Object cause, StackTrace stackTrace)
      : super(cause, stackTrace);

  final String errorMessage;
}

/// Thrown when there is error in the client side (I.e. HTTP 4xx).
class ApiClientException extends RemoteApiException {
  ApiClientException(this.errorMessage, Object cause, StackTrace stackTrace)
      : super(cause, stackTrace);

  final String errorMessage;
}

/// Thrown when there is error in the server side (I.e. HTTP 5xx).
class ApiServerException extends RemoteApiException {
  ApiServerException(this.errorMessage, Object cause, StackTrace stackTrace)
      : super(cause, stackTrace);

  final String errorMessage;
}

/// Thrown when there is an unknown error.
class ApiUnknownException extends RemoteApiException {
  ApiUnknownException(Object cause, StackTrace stackTrace)
      : super(cause, stackTrace);
}

/// Thrown when there is a connection timeput.
class ApiConnectionTimeoutException extends RemoteApiException {
  ApiConnectionTimeoutException(Object cause, StackTrace stackTrace)
      : super(cause, stackTrace);
}
