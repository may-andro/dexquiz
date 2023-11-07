import 'package:firebase/src/crashlytics/crashlytics_record_flutter_error_use_case.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(CrashlyticsFlutterRecordErrorUseCase, () {
    late CrashlyticsFlutterRecordErrorUseCase
        crashlyticsFlutterRecordErrorUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      crashlyticsFlutterRecordErrorUseCase =
          CrashlyticsFlutterRecordErrorUseCase(
        mockFirebaseCrashlytics,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        final error = FlutterErrorDetails(exception: 'test');

        when(() => mockFirebaseCrashlytics.recordFlutterError(error))
            .thenAnswer(
          (invocation) => Future.value(),
        );

        crashlyticsFlutterRecordErrorUseCase(error);

        verify(() => mockFirebaseCrashlytics.recordFlutterError(error))
            .called(1);
      });
    });
  });
}
