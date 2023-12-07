import 'package:error_reporter/src/exception/app_exception.dart';
import 'package:meta/meta.dart';

@internal
class HandlerRegisteredException implements AppException {
  @override
  String toString() {
    return 'HandlerRegisteredException: The handler is already registered';
  }
}
