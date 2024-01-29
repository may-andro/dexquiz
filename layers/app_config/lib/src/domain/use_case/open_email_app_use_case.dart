import 'package:app_config/src/domain/repository/external_app_launcher_repository.dart';
import 'package:use_case/use_case.dart';

class OpenEmailAppParam {
  OpenEmailAppParam(
    this.email,
    this.subject,
    this.body,
  );

  final String email;
  final String? subject;
  final String? body;
}

class OpenEmailAppUseCase
    extends BaseAsyncUseCase<void, OpenEmailAppParam, UnknownFailure> {
  OpenEmailAppUseCase(this._externalAppLauncherRepository);

  final ExternalAppLauncherRepository _externalAppLauncherRepository;

  @override
  AsyncEither<UnknownFailure, void> execute(OpenEmailAppParam param) async {
    try {
      final result = await _externalAppLauncherRepository.openEmailApp(
        param.email,
        subject: param.subject,
        body: param.body,
      );
      if (result) return Right(null);
      return Left(UnknownFailure(message: 'Failed to open email app'));
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownFailure(
          message: 'Failed to open email app: $error',
          cause: error,
        ),
      );
    }
  }
}
