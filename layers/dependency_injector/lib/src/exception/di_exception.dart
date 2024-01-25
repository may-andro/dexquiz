sealed class DIException implements Exception {
  DIException(this.message, this.cause);

  final String? message;
  final Object? cause;
}

class PreRegisterDIException extends DIException {
  PreRegisterDIException(super.message, super.cause);
}

class RegisterDIException extends DIException {
  RegisterDIException(super.message, super.cause);
}

class PostRegisterDIException extends DIException {
  PostRegisterDIException(super.message, super.cause);
}
