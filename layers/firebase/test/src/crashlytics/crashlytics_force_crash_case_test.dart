import 'package:firebase/src/crashlytics/crashlytics_force_crash_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';
import '../../_mock/mock_is_crashlytics_enabled_use_case.dart';

void main() {
  group(CrashlyticsForceCrashUseCase, () {
    late CrashlyticsForceCrashUseCase crashlyticsForceCrashUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;
    late MockIsCrashlyticsEnabledUseCase mockIsCrashlyticsEnabledUseCase;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();
      mockIsCrashlyticsEnabledUseCase = MockIsCrashlyticsEnabledUseCase();

      crashlyticsForceCrashUseCase = CrashlyticsForceCrashUseCase(
        mockFirebaseCrashlytics,
        mockIsCrashlyticsEnabledUseCase,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics when Crashlytics is enabled', () {
        mockIsCrashlyticsEnabledUseCase.mockCall(true);

        crashlyticsForceCrashUseCase();

        verify(() => mockFirebaseCrashlytics.crash()).called(1);
      });

      test('should not call FirebaseCrashlytics when Crashlytics is disabled',
          () {
        mockIsCrashlyticsEnabledUseCase.mockCall(false);

        crashlyticsForceCrashUseCase();

        verifyNever(() => mockFirebaseCrashlytics.crash());
      });
    });
  });
}
