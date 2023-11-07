import 'package:firebase/src/crashlytics/crashlytics_log_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(CrashlyticsLogUseCase, () {
    late CrashlyticsLogUseCase crashlyticsLogUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      crashlyticsLogUseCase = CrashlyticsLogUseCase(
        mockFirebaseCrashlytics,
      );

      when(() => mockFirebaseCrashlytics.log(any())).thenAnswer(
        (invocation) => Future.value(),
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        crashlyticsLogUseCase('test');

        verify(() => mockFirebaseCrashlytics.log(any())).called(1);
      });
    });
  });
}
