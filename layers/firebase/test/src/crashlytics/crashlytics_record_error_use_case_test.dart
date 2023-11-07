import 'package:firebase/src/crashlytics/crashlytics_record_error_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(CrashlyticsRecordErrorUseCase, () {
    late CrashlyticsRecordErrorUseCase crashlyticsRecordErrorUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      crashlyticsRecordErrorUseCase = CrashlyticsRecordErrorUseCase(
        mockFirebaseCrashlytics,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        final error = '';
        final st = null;
        final isFatal = true;

        when(() =>
                mockFirebaseCrashlytics.recordError(error, st, fatal: isFatal))
            .thenAnswer(
          (invocation) => Future.value(),
        );

        crashlyticsRecordErrorUseCase(error, st, isFatal: isFatal);

        verify(() =>
                mockFirebaseCrashlytics.recordError(error, st, fatal: isFatal))
            .called(1);
      });
    });
  });
}
