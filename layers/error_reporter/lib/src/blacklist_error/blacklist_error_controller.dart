import 'package:error_reporter/src/blacklist_error/blacklist_error_handler.dart';
import 'package:error_reporter/src/exception/handler_registered_exception.dart';
import 'package:meta/meta.dart';

@internal
class BlacklistErrorController {
  final List<BlacklistErrorHandler> _handlers = [];

  void register(BlacklistErrorHandler handler) {
    if (_handlers.contains(handler)) {
      throw HandlerRegisteredException();
    }
    _handlers.add(handler);
  }

  List<BlacklistErrorHandler> get registeredHandlers => _handlers;
}
