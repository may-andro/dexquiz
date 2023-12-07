import 'package:error_reporter/src/blacklist_error/blacklist_error_controller.dart';
import 'package:error_reporter/src/blacklist_error/blacklist_error_handler.dart';
import 'package:use_case/use_case.dart';

class RegisterBlacklistErrorHandlerUseCase
    extends BaseSyncUseCase<void, BlacklistErrorHandler, NoFailure> {
  RegisterBlacklistErrorHandlerUseCase(this._controller);

  final BlacklistErrorController _controller;

  @override
  Either<NoFailure, void> execute(
    BlacklistErrorHandler input,
  ) {
    try {
      return Right(_controller.register(input));
    } catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
