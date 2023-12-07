import 'package:error_reporter/src/reporter/logger_error_reporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/src/exception/test_fatal_exception.dart';
import '../../mock/src/fatal_error/mock_fatal_exception_handler_use_case.dart';
import '../../mock/src/fatal_error/mock_is_fatal_exception_use_case.dart';

class MockLogReporter extends Mock implements LogReporter {
  void mockError() {
    when(() => error(any())).thenReturn(null);
  }

  void mockDebug() {
    when(() => debug(any())).thenReturn(null);
  }
}

class FakedException extends Fake implements Exception {}

class FakedStackTrace extends Fake implements StackTrace {}

void main() {
  group(LoggerErrorReporter, () {
    late LoggerErrorReporter loggerErrorReporter;

    late MockIsFatalErrorUseCase mockIsFatalErrorUseCase;
    late MockFatalErrorHandlerUseCase mockFatalErrorHandlerUseCase;
    late MockLogReporter mockLogReporter;

    setUpAll(() {
      registerFallbackValue(FakedException());
      registerFallbackValue(FakedStackTrace());
    });

    setUp(() {
      mockIsFatalErrorUseCase = MockIsFatalErrorUseCase();
      mockFatalErrorHandlerUseCase = MockFatalErrorHandlerUseCase();
      mockLogReporter = MockLogReporter();

      loggerErrorReporter = LoggerErrorReporter(
        mockIsFatalErrorUseCase,
        mockFatalErrorHandlerUseCase,
        mockLogReporter,
      );
    });

    group('init', () {
      test(
        'should register ${FlutterError.onError}',
        () async {
          mockFatalErrorHandlerUseCase.mockCall();
          mockIsFatalErrorUseCase.mockCall(true);

          await loggerErrorReporter.init();

          expect(FlutterError.onError, isNotNull);
        },
      );
    });

    group('reportError', () {
      test(
        'should log error in $LogReporter ',
        () async {
          final exception = TestFatalException();
          final stackTrace = StackTrace.current;

          await loggerErrorReporter.reportError(
            exception: exception,
            stackTrace: stackTrace,
          );

          verify(
            () => mockLogReporter.error(
              'Error occurred due to $exception',
              tag: null,
              error: exception,
              stacktrace: stackTrace,
            ),
          ).called(1);
        },
      );
    });
  });
}
