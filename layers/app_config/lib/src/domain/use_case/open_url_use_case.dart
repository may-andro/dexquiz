import 'package:app_config/src/domain/repository/external_app_launcher_repository.dart';
import 'package:use_case/use_case.dart';

class OpenUrlUseCase extends BaseAsyncUseCase<void, String, OpenUrlFailure> {
  OpenUrlUseCase(this._externalAppLauncherRepository);

  final ExternalAppLauncherRepository _externalAppLauncherRepository;

  @override
  AsyncEither<OpenUrlFailure, void> execute(String url) async {
    try {
      final result = await _externalAppLauncherRepository.openWebUrl(url);
      if (result) return Right(null);
      return Left(UrlLaunchFailure(message: 'Failed to open url'));
    } on InvalidUrlException catch (error, st) {
      reportError(error, st);
      return Left(
        InvalidUrlFailure(
          message: 'Failed to open url: $error',
          cause: error,
        ),
      );
    } on UrlLaunchFailedException catch (error, st) {
      reportError(error, st);
      return Left(
        UrlLaunchFailure(
          message: 'Failed to open url: $error',
          cause: error,
        ),
      );
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownUrlFailure(
          message: 'Failed to open url: $error',
          cause: error,
        ),
      );
    }
  }
}

sealed class OpenUrlFailure extends BasicFailure {
  const OpenUrlFailure({super.message, super.cause});
}

final class InvalidUrlFailure extends OpenUrlFailure {
  const InvalidUrlFailure({super.message, super.cause});
}

final class UrlLaunchFailure extends OpenUrlFailure {
  const UrlLaunchFailure({super.message, super.cause});
}

final class UnknownUrlFailure extends OpenUrlFailure {
  const UnknownUrlFailure({super.message, super.cause});
}
