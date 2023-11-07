import 'package:firebase/src/crashlytics/crashlytics_force_crash_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(CrashlyticsForceCrashUseCase, () {
    late CrashlyticsForceCrashUseCase crashlyticsForceCrashUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      crashlyticsForceCrashUseCase = CrashlyticsForceCrashUseCase(
        mockFirebaseCrashlytics,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        crashlyticsForceCrashUseCase();

        verify(() => mockFirebaseCrashlytics.crash()).called(1);
      });
    });
  });
}
