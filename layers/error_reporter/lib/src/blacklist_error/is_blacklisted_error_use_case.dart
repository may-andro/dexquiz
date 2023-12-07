import 'package:error_reporter/src/blacklist_error/blacklist_error_controller.dart';
import 'package:meta/meta.dart';

@internal
class IsBlacklistedErrorUseCase {
  IsBlacklistedErrorUseCase(this._controller);

  final BlacklistErrorController _controller;

  bool call(Object error) {
    final handlers = _controller.registeredHandlers;
    return handlers.any((handler) => handler.isBlacklistError(error));
  }
}
