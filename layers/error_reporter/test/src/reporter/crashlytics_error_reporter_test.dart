import 'package:error_reporter/src/fatal_error/fatal_error.dart';
import 'package:error_reporter/src/reporter/crashlytics_error_reporter.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/src/blacklist_error/mock_is_blacklisted_error_use_case.dart';
import '../../mock/src/exception/test_fatal_exception.dart';
import '../../mock/src/fatal_error/mock_fatal_exception_handler_use_case.dart';
import '../../mock/src/fatal_error/mock_is_fatal_exception_use_case.dart';
import 'logger_error_reporter_test.dart';

class MockCrashlyticsRecordErrorUseCase extends Mock
    implements CrashlyticsRecordErrorUseCase {
  void mockCall() {
    when(
      () => call(any(), any(), isFatal: any(named: 'isFatal')),
    ).thenAnswer((_) => Future.value());
  }
}

class MockCrashlyticsFlutterRecordErrorUseCase extends Mock
    implements CrashlyticsFlutterRecordErrorUseCase {
  void mockCall() {
    when(() => call(any())).thenAnswer((_) => Future.value());
  }
}

class FakedException extends Fake implements Exception {}

class FakedStackTrace extends Fake implements StackTrace {}

void main() {
  group(CrashlyticsErrorReporter, () {
    late CrashlyticsErrorReporter crashlyticsErrorReporter;

    late MockIsBlacklistedErrorUseCase mockIsBlacklistedErrorUseCase;
    late MockIsFatalErrorUseCase mockIsFatalErrorUseCase;
    late MockFatalErrorHandlerUseCase mockFatalErrorHandlerUseCase;
    late MockCrashlyticsRecordErrorUseCase mockCrashlyticsRecordErrorUseCase;
    late MockCrashlyticsFlutterRecordErrorUseCase
        mockCrashlyticsFlutterRecordErrorUseCase;
    late MockLogReporter mockLogReporter;

    setUpAll(() {
      registerFallbackValue(const FlutterErrorDetails(exception: 'test'));
      registerFallbackValue(FakedException());
      registerFallbackValue(FakedStackTrace());
    });

    setUp(() {
      mockIsBlacklistedErrorUseCase = MockIsBlacklistedErrorUseCase();
      mockIsFatalErrorUseCase = MockIsFatalErrorUseCase();
      mockFatalErrorHandlerUseCase = MockFatalErrorHandlerUseCase();
      mockCrashlyticsRecordErrorUseCase = MockCrashlyticsRecordErrorUseCase();
      mockCrashlyticsFlutterRecordErrorUseCase =
          MockCrashlyticsFlutterRecordErrorUseCase();
      mockLogReporter = MockLogReporter();

      crashlyticsErrorReporter = CrashlyticsErrorReporter(
        mockIsBlacklistedErrorUseCase,
        mockIsFatalErrorUseCase,
        mockFatalErrorHandlerUseCase,
        mockCrashlyticsRecordErrorUseCase,
        mockCrashlyticsFlutterRecordErrorUseCase,
        mockLogReporter,
      );
    });

    group('init', () {
      test(
        'should register ${FlutterError.onError}',
        () async {
          mockFatalErrorHandlerUseCase.mockCall();
          mockCrashlyticsRecordErrorUseCase.mockCall();
          mockCrashlyticsFlutterRecordErrorUseCase.mockCall();
          mockIsFatalErrorUseCase.mockCall(true);
          mockIsBlacklistedErrorUseCase.mockCall(false);

          await crashlyticsErrorReporter.init();

          expect(FlutterError.onError, isNotNull);
        },
      );
    });

    group('reportError', () {
      setUp(() {
        mockFatalErrorHandlerUseCase.mockCall();
        mockCrashlyticsRecordErrorUseCase.mockCall();
        mockCrashlyticsFlutterRecordErrorUseCase.mockCall();
      });

      test(
        'should report fatal error '
        'when the error is not blacklisted',
        () async {
          final exception = TestFatalException();
          final stackTrace = StackTrace.current;
          mockIsFatalErrorUseCase.mockCall(true);
          mockIsBlacklistedErrorUseCase.mockCall(false);

          await crashlyticsErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verify(
            () => mockCrashlyticsRecordErrorUseCase(
              exception,
              stackTrace,
              isFatal: true,
            ),
          ).called(1);
        },
      );

      test(
        'should not report fatal error '
        'when the error is blacklisted',
        () async {
          final exception = TestFatalException();
          final stackTrace = StackTrace.current;
          mockIsFatalErrorUseCase.mockCall(true);
          mockIsBlacklistedErrorUseCase.mockCall(true);

          await crashlyticsErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verifyNever(
            () => mockCrashlyticsRecordErrorUseCase(
              exception,
              stackTrace,
              isFatal: any(named: 'isFatal'),
            ),
          );
        },
      );

      test(
        'should call $FatalErrorHandler '
        'when the error is fatal',
        () async {
          final exception = TestFatalException();
          final stackTrace = StackTrace.current;
          mockIsFatalErrorUseCase.mockCall(true);
          mockIsBlacklistedErrorUseCase.mockCall(true);

          await crashlyticsErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verify(
            () => mockFatalErrorHandlerUseCase(any()),
          ).called(1);

          mockIsBlacklistedErrorUseCase.mockCall(false);

          await crashlyticsErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verify(
            () => mockFatalErrorHandlerUseCase(any()),
          ).called(1);
        },
      );

      test(
        'should not report non fatal error '
        'when the error is blacklisted',
        () async {
          final exception = TestFatalException();
          final stackTrace = StackTrace.current;
          mockIsFatalErrorUseCase.mockCall(false);
          mockIsBlacklistedErrorUseCase.mockCall(true);

          await crashlyticsErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verifyNever(
            () => mockCrashlyticsRecordErrorUseCase(
              exception,
              stackTrace,
              isFatal: any(named: 'isFatal'),
            ),
          );
        },
      );

      test(
        'should report non fatal error '
        'when the error is not blacklisted',
        () async {
          final exception = TestFatalException();
          final stackTrace = StackTrace.current;
          mockIsFatalErrorUseCase.mockCall(false);
          mockIsBlacklistedErrorUseCase.mockCall(false);

          await crashlyticsErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verify(
            () => mockCrashlyticsRecordErrorUseCase(
              exception,
              stackTrace,
              isFatal: false,
            ),
          ).called(1);
        },
      );
    });
  });
}
