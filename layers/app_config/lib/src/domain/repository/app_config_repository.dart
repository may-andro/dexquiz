import 'package:app_config/src/domain/model/app_config.dart';

abstract class AppConfigRepository {
  Future<AppConfig?> getAppConfig();
}
