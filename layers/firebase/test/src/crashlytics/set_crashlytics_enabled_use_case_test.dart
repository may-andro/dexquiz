import 'package:firebase/src/crashlytics/set_crashlytics_enabled_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(SetCrashlyticsEnabledUseCase, () {
    late SetCrashlyticsEnabledUseCase setCrashlyticsEnabledUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      setCrashlyticsEnabledUseCase = SetCrashlyticsEnabledUseCase(
        mockFirebaseCrashlytics,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        when(
          () => mockFirebaseCrashlytics.setCrashlyticsCollectionEnabled(any()),
        ).thenAnswer((invocation) => Future.value());

        setCrashlyticsEnabledUseCase(true);

        verify(
          () => mockFirebaseCrashlytics.setCrashlyticsCollectionEnabled(any()),
        ).called(1);
      });
    });
  });
}
