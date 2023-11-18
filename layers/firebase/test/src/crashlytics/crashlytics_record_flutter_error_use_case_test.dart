import 'package:firebase/src/crashlytics/crashlytics_record_flutter_error_use_case.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';
import '../../_mock/mock_is_crashlytics_enabled_use_case.dart';

void main() {
  group(CrashlyticsFlutterRecordErrorUseCase, () {
    late CrashlyticsFlutterRecordErrorUseCase
        crashlyticsFlutterRecordErrorUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;
    late MockIsCrashlyticsEnabledUseCase mockIsCrashlyticsEnabledUseCase;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();
      mockIsCrashlyticsEnabledUseCase = MockIsCrashlyticsEnabledUseCase();

      crashlyticsFlutterRecordErrorUseCase =
          CrashlyticsFlutterRecordErrorUseCase(
        mockFirebaseCrashlytics,
        mockIsCrashlyticsEnabledUseCase,
      );
    });

    group('call', () {
      final error = FlutterErrorDetails(exception: 'test');

      setUp(() {
        when(() => mockFirebaseCrashlytics.recordFlutterError(error))
            .thenAnswer(
          (invocation) => Future.value(),
        );
      });

      test('should call FirebaseCrashlytics when Crashlytics is enabled', () {
        mockIsCrashlyticsEnabledUseCase.mockCall(true);

        crashlyticsFlutterRecordErrorUseCase(error);

        verify(() => mockFirebaseCrashlytics.recordFlutterError(error))
            .called(1);
      });

      test('should not call FirebaseCrashlytics when Crashlytics is disabled',
          () {
        mockIsCrashlyticsEnabledUseCase.mockCall(false);

        crashlyticsFlutterRecordErrorUseCase(error);

        verifyNever(() => mockFirebaseCrashlytics.recordFlutterError(error));
      });
    });
  });
}
