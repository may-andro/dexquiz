class PreRegisterDIException implements Exception {
  PreRegisterDIException(this.message, this.cause);

  final String? message;

  final Object? cause;
}

class RegisterDIException implements Exception {
  RegisterDIException(this.message, this.cause);

  final String? message;

  final Object? cause;
}

class PostRegisterDIException implements Exception {
  PostRegisterDIException(this.message, this.cause);

  final String? message;

  final Object? cause;
}
