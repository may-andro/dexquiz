import 'package:error_reporter/src/fatal_error/fatal_error_controller.dart';
import 'package:error_reporter/src/fatal_error/fatal_error_handler.dart';
import 'package:use_case/use_case.dart';

class RegisterFatalErrorHandlerUseCase
    extends BaseSyncUseCase<void, FatalErrorHandler, NoFailure> {
  RegisterFatalErrorHandlerUseCase(this._fatalErrorController);

  final FatalErrorController _fatalErrorController;

  @override
  Either<NoFailure, void> execute(FatalErrorHandler input) {
    try {
      return Right(_fatalErrorController.register(input));
    } catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
