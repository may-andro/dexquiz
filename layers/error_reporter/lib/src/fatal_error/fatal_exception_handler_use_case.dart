import 'package:error_reporter/src/fatal_error/fatal_error_controller.dart';
import 'package:meta/meta.dart';

@internal
class FatalErrorHandlerUseCase {
  FatalErrorHandlerUseCase(this._fatalErrorController);

  final FatalErrorController _fatalErrorController;

  Future<void> call(Object error) async {
    final list = _fatalErrorController.registeredHandlers;
    return Future.forEach(
      list,
      (handler) => handler.onFatalError(error),
    );
  }
}
