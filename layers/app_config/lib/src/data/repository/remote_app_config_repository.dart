import 'package:app_config/src/domain/model/app_config.dart';
import 'package:app_config/src/domain/repository/app_config_repository.dart';
import 'package:core/core.dart';
import 'package:firebase/firebase.dart';

class RemoteAppConfigRepository implements AppConfigRepository {
  RemoteAppConfigRepository(
    this._getDocumentUseCase,
    this._buildConfig,
  );

  final GetDocumentUseCase _getDocumentUseCase;
  final BuildConfig _buildConfig;

  @override
  Future<AppConfig?> getAppConfig() async {
    final appConfigMap = await _getDocumentUseCase.call(
      GetDocumentParam('app_config', '${_buildConfig.buildEnvironment.name}'),
    );
    if (appConfigMap != null) {
      return AppConfig.fromJson(appConfigMap);
    }
    return null;
  }
}
