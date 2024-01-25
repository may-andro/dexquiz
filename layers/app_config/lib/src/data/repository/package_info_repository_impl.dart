import 'package:app_config/src/domain/model/app_info.dart';
import 'package:app_config/src/domain/repository/package_info_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class PackageInfoRepositoryImpl implements PackageInfoRepository {
  @override
  Future<AppInfo> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    return AppInfo(
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
    );
  }
}
