import 'package:firebase/src/crashlytics/set_crashlytics_user_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';
import '../../_mock/mock_is_crashlytics_enabled_use_case.dart';

void main() {
  group(SetCrashlyticsUserUseCase, () {
    late SetCrashlyticsUserUseCase setCrashlyticsUserUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;
    late MockIsCrashlyticsEnabledUseCase mockIsCrashlyticsEnabledUseCase;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();
      mockIsCrashlyticsEnabledUseCase = MockIsCrashlyticsEnabledUseCase();

      setCrashlyticsUserUseCase = SetCrashlyticsUserUseCase(
        mockFirebaseCrashlytics,
        mockIsCrashlyticsEnabledUseCase,
      );
    });

    group('call', () {
      setUp(() {
        when(
          () => mockFirebaseCrashlytics.setUserIdentifier(any()),
        ).thenAnswer((invocation) => Future.value());
      });

      test('should call FirebaseCrashlytics when Crashlytics is enabled', () {
        mockIsCrashlyticsEnabledUseCase.mockCall(true);

        setCrashlyticsUserUseCase('test');

        verify(
          () => mockFirebaseCrashlytics.setUserIdentifier(any()),
        ).called(1);
      });

      test('should not call FirebaseCrashlytics when Crashlytics is disabled',
          () {
        mockIsCrashlyticsEnabledUseCase.mockCall(false);

        setCrashlyticsUserUseCase('test');

        verifyNever(() => mockFirebaseCrashlytics.setUserIdentifier(any()));
      });
    });
  });
}
