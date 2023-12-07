import 'package:firebase/src/crashlytics/crashlytics_log_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';
import '../../_mock/mock_is_crashlytics_enabled_use_case.dart';

void main() {
  group(CrashlyticsLogUseCase, () {
    late CrashlyticsLogUseCase crashlyticsLogUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;
    late MockIsCrashlyticsEnabledUseCase mockIsCrashlyticsEnabledUseCase;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();
      mockIsCrashlyticsEnabledUseCase = MockIsCrashlyticsEnabledUseCase();

      crashlyticsLogUseCase = CrashlyticsLogUseCase(
        mockFirebaseCrashlytics,
        mockIsCrashlyticsEnabledUseCase,
      );

      when(() => mockFirebaseCrashlytics.log(any())).thenAnswer(
        (invocation) => Future.value(),
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics when Crashlytics is enabled', () {
        mockIsCrashlyticsEnabledUseCase.mockCall(true);

        crashlyticsLogUseCase('test');

        verify(() => mockFirebaseCrashlytics.log(any())).called(1);
      });

      test('should not call FirebaseCrashlytics when Crashlytics is disabled',
          () {
        mockIsCrashlyticsEnabledUseCase.mockCall(false);

        crashlyticsLogUseCase('test');

        verifyNever(() => mockFirebaseCrashlytics.log(any()));
      });
    });
  });
}
