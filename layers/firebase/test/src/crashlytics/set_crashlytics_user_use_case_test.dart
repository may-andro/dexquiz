import 'package:firebase/src/crashlytics/set_crashlytics_user_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../_mock/mock_firebase_crashlytics.dart';

void main() {
  group(SetCrashlyticsUserUseCase, () {
    late SetCrashlyticsUserUseCase setCrashlyticsUserUseCase;

    late MockFirebaseCrashlytics mockFirebaseCrashlytics;

    setUp(() {
      mockFirebaseCrashlytics = MockFirebaseCrashlytics();

      setCrashlyticsUserUseCase = SetCrashlyticsUserUseCase(
        mockFirebaseCrashlytics,
      );
    });

    group('call', () {
      test('should call FirebaseCrashlytics', () {
        when(
          () => mockFirebaseCrashlytics.setUserIdentifier(any()),
        ).thenAnswer((invocation) => Future.value());

        setCrashlyticsUserUseCase('test');

        verify(
          () => mockFirebaseCrashlytics.setUserIdentifier(any()),
        ).called(1);
      });
    });
  });
}
