import 'package:app_config/src/domain/model/app_config.dart';
import 'package:app_config/src/domain/repository/app_config_repository.dart';
import 'package:use_case/use_case.dart';

class GetAppConfigUseCase
    extends BaseNoParamAsyncUseCase<AppConfig, GetAppConfigFailure> {
  GetAppConfigUseCase(this._appConfigRepository);

  final AppConfigRepository _appConfigRepository;

  @override
  AsyncEither<GetAppConfigFailure, AppConfig> execute() async {
    try {
      final appConfig = await _appConfigRepository.getAppConfig();
      if (appConfig == null) {
        return Left(NoAppConfigFoundFailure());
      }
      return Right(appConfig);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownAppConfigFailure());
    }
  }
}

sealed class GetAppConfigFailure extends BasicFailure {
  const GetAppConfigFailure({super.message, super.cause});
}

class NoAppConfigFoundFailure extends GetAppConfigFailure {
  const NoAppConfigFoundFailure({super.message, super.cause});
}

class UnknownAppConfigFailure extends GetAppConfigFailure {
  const UnknownAppConfigFailure({super.message, super.cause});
}
