import 'package:app_config/app_config.dart';
import 'package:app_config/src/data/repository/remote_app_config_repository.dart';
import 'package:core/core.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDocumentUseCase extends Mock implements GetDocumentUseCase {
  void mockCall(Map<String, dynamic>? expected) {
    when(() => call(any())).thenAnswer((_) async => expected);
  }

  void mockCallException() {
    when(() => call(any())).thenThrow(Exception());
  }
}

void main() {
  group(RemoteAppConfigRepository, () {
    late RemoteAppConfigRepository remoteAppConfigRepository;

    late MockGetDocumentUseCase mockGetDocumentUseCase;
    late BuildConfig buildConfig;

    setUpAll(() {
      registerFallbackValue(GetDocumentParam('', ''));
    });

    setUp(() {
      buildConfig = BuildConfig(
        buildEnvironment: BuildEnvironment.staging,
        buildFlavor: BuildFlavor.kanto,
      );
      mockGetDocumentUseCase = MockGetDocumentUseCase();

      remoteAppConfigRepository = RemoteAppConfigRepository(
        mockGetDocumentUseCase,
        buildConfig,
      );
    });

    group('getAppConfig', () {
      test('should return $AppConfig when there is data', () async {
        final appConfig = AppConfig('test', 'test', 1, 1);
        mockGetDocumentUseCase.mockCall(appConfig.toJson());

        final result = await remoteAppConfigRepository.getAppConfig();

        expect(result, appConfig);
      });

      test('should return null when there is no data', () async {
        mockGetDocumentUseCase.mockCall(null);

        final result = await remoteAppConfigRepository.getAppConfig();

        expect(result, null);
      });

      test('should handle exception', () async {
        mockGetDocumentUseCase.mockCallException();

        expect(
          () => remoteAppConfigRepository.getAppConfig(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
