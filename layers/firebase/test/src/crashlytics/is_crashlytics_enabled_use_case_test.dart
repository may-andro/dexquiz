import 'package:firebase/src/crashlytics/is_crashlytics_enabled_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(IsCrashlyticsEnabledUseCase, () {
    late IsCrashlyticsEnabledUseCase isCrashlyticsEnabledUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      isCrashlyticsEnabledUseCase = IsCrashlyticsEnabledUseCase(
        mockFirebaseCrashlytics,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        when(() => mockFirebaseCrashlytics.isCrashlyticsCollectionEnabled)
            .thenReturn(true);

        isCrashlyticsEnabledUseCase();

        verify(() => mockFirebaseCrashlytics.isCrashlyticsCollectionEnabled)
            .called(1);
      });
    });
  });
}
