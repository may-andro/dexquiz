import 'package:app_config/src/domain/model/app_config.dart';
import 'package:app_config/src/domain/repository/app_config_repository.dart';
import 'package:app_config/src/domain/use_case/get_app_config_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockAppConfigRepository extends Mock implements AppConfigRepository {
  void mockGetAppConfig(AppConfig? expected) {
    when(() => getAppConfig()).thenAnswer((_) async => expected);
  }

  void mockCallException() {
    when(() => getAppConfig()).thenThrow(Exception());
  }
}

void main() {
  group(GetAppConfigUseCase, () {
    late GetAppConfigUseCase getAppConfigUseCase;

    late MockAppConfigRepository mockAppConfigRepository;

    setUp(() {
      mockAppConfigRepository = MockAppConfigRepository();

      getAppConfigUseCase = GetAppConfigUseCase(mockAppConfigRepository);
    });

    group('call', () {
      test('should return $Right with $AppConfig', () async {
        final appConfig = AppConfig.empty();
        mockAppConfigRepository.mockGetAppConfig(appConfig);

        final result = await getAppConfigUseCase.call();

        expect(result.isRight, true);
        expect(result.right, appConfig);
      });

      test(
          'should return $Left with $NoAppConfigFoundFailure '
          'when the $AppConfigRepository returns null', () async {
        mockAppConfigRepository.mockGetAppConfig(null);

        final result = await getAppConfigUseCase.call();

        expect(result.isLeft, true);
        expect(result.left, isA<NoAppConfigFoundFailure>());
      });

      test(
          'should return $Left with $UnknownAppConfigFailure '
          'when there is an error', () async {
        mockAppConfigRepository.mockCallException();

        final result = await getAppConfigUseCase.call();

        expect(result.isLeft, true);
        expect(result.left, isA<UnknownAppConfigFailure>());
      });
    });
  });
}
