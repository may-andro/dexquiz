import 'package:app_config/src/domain/model/app_info.dart';
import 'package:app_config/src/domain/repository/package_info_repository.dart';
import 'package:use_case/use_case.dart';

class GetAppInfoUseCase
    extends BaseNoParamAsyncUseCase<AppInfo, UnknownFailure> {
  GetAppInfoUseCase(this._packageInfoRepository);

  final PackageInfoRepository _packageInfoRepository;

  @override
  AsyncEither<UnknownFailure, AppInfo> execute() async {
    try {
      final appInfo = await _packageInfoRepository.getAppInfo();
      return Right(appInfo);
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownFailure(
          message: 'Failed to fetch app information',
          cause: error,
        ),
      );
    }
  }
}
