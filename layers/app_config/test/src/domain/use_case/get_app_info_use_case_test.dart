import 'package:app_config/src/domain/model/app_info.dart';
import 'package:app_config/src/domain/repository/package_info_repository.dart';
import 'package:app_config/src/domain/use_case/get_app_info_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockPackageInfoRepository extends Mock implements PackageInfoRepository {
  void mockCall(AppInfo expected) {
    when(() => getAppInfo()).thenAnswer((invocation) async => expected);
  }

  void mockCallException() {
    when(() => getAppInfo()).thenThrow(Exception());
  }
}

void main() {
  group(GetAppInfoUseCase, () {
    late GetAppInfoUseCase getAppInfoUseCase;

    late MockPackageInfoRepository mockPackageInfoRepository;

    setUp(() {
      mockPackageInfoRepository = MockPackageInfoRepository();

      getAppInfoUseCase = GetAppInfoUseCase(mockPackageInfoRepository);
    });

    group('call', () {
      test('should return $AppInfo', () async {
        final appInfo = AppInfo(
          appName: 'appName',
          packageName: 'packageName',
          version: 'version',
          buildNumber: 'buildNumber',
        );

        mockPackageInfoRepository.mockCall(appInfo);

        final result = await getAppInfoUseCase();

        expect(result.right, appInfo);
      });

      test('should return $UnknownFailure when there is error', () async {
        mockPackageInfoRepository.mockCallException();

        final result = await getAppInfoUseCase();

        expect(result.isLeft, true);
      });
    });
  });
}
