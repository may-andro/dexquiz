import 'package:firebase/src/crashlytics/crashlytics_record_error_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';
import '../../_mock/mock_is_crashlytics_enabled_use_case.dart';

void main() {
  group(CrashlyticsRecordErrorUseCase, () {
    late CrashlyticsRecordErrorUseCase crashlyticsRecordErrorUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;
    late MockIsCrashlyticsEnabledUseCase mockIsCrashlyticsEnabledUseCase;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();
      mockIsCrashlyticsEnabledUseCase = MockIsCrashlyticsEnabledUseCase();

      crashlyticsRecordErrorUseCase = CrashlyticsRecordErrorUseCase(
        mockFirebaseCrashlytics,
        mockIsCrashlyticsEnabledUseCase,
      );
    });

    group('call', () {
      final error = '';
      final st = null;
      final isFatal = true;

      setUp(() {
        when(() =>
                mockFirebaseCrashlytics.recordError(error, st, fatal: isFatal))
            .thenAnswer(
          (invocation) => Future.value(),
        );
      });

      test('should call FirebaseCrashlytics when Crashlytics is enabled', () {
        mockIsCrashlyticsEnabledUseCase.mockCall(true);

        crashlyticsRecordErrorUseCase(error, st, isFatal: isFatal);

        verify(
          () => mockFirebaseCrashlytics.recordError(error, st, fatal: isFatal),
        ).called(1);
      });

      test('should not call FirebaseCrashlytics when Crashlytics is disabled',
          () {
        mockIsCrashlyticsEnabledUseCase.mockCall(false);

        crashlyticsRecordErrorUseCase(error, st, isFatal: isFatal);

        verifyNever(
          () => mockFirebaseCrashlytics.recordError(error, st, fatal: isFatal),
        );
      });
    });
  });
}
