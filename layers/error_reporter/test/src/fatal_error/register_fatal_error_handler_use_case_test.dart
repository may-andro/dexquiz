import 'package:error_reporter/src/fatal_error/fatal_error_controller.dart';
import 'package:error_reporter/src/fatal_error/fatal_error_handler.dart';
import 'package:error_reporter/src/fatal_error/register_fatal_error_handler_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

import '../../mock/src/fatal_error/mock_fatal_error_controller.dart';
import '../../mock/src/fatal_error/mock_fatal_exception_handler.dart';

class FakedFatalErrorHandler extends Fake implements FatalErrorHandler {}

void main() {
  group(RegisterFatalErrorHandlerUseCase, () {
    late RegisterFatalErrorHandlerUseCase useCase;

    late MockFatalErrorController mockFatalErrorController;
    late MockFatalErrorHandler mockFatalErrorHandler;

    setUpAll(() {
      registerFallbackValue(FakedFatalErrorHandler());
    });

    setUp(() {
      mockFatalErrorController = MockFatalErrorController();
      mockFatalErrorHandler = MockFatalErrorHandler();

      useCase = RegisterFatalErrorHandlerUseCase(
        mockFatalErrorController,
      );
    });

    group('call', () {
      test(
        'should register $FatalErrorHandler in $FatalErrorController',
        () {
          final result = useCase(mockFatalErrorHandler);

          expect(result, isA<Right<NoFailure, void>>());
          verify(
            () => mockFatalErrorController.register(mockFatalErrorHandler),
          ).called(1);
        },
      );
    });

    test(
      'should return $Left on exception',
      () {
        mockFatalErrorController.mockRegisterThrowsError();

        final result = useCase(mockFatalErrorHandler);

        expect(result, isA<Left<NoFailure, void>>());
      },
    );
  });
}
