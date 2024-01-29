import 'package:app_config/src/domain/model/app_info.dart';

abstract class PackageInfoRepository {
  Future<AppInfo> getAppInfo();
}
