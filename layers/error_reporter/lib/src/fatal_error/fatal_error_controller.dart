import 'package:error_reporter/src/exception/handler_registered_exception.dart';
import 'package:error_reporter/src/fatal_error/fatal_error_handler.dart';
import 'package:meta/meta.dart';

@internal
class FatalErrorController {
  final List<FatalErrorHandler> _handlers = [];

  void register(FatalErrorHandler handler) {
    if (_handlers.contains(handler)) {
      throw HandlerRegisteredException();
    }
    _handlers.add(handler);
  }

  List<FatalErrorHandler> get registeredHandlers => _handlers;
}
