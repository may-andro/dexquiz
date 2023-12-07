import 'package:error_reporter/src/fatal_error/fatal_error_handler.dart';
import 'package:error_reporter/src/fatal_error/fatal_exception_handler_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/src/fatal_error/mock_fatal_error_controller.dart';
import '../../mock/src/fatal_error/mock_fatal_exception_handler.dart';

void main() {
  group(FatalErrorHandlerUseCase, () {
    late FatalErrorHandlerUseCase useCase;

    late MockFatalErrorController mockFatalErrorController;

    setUp(() {
      mockFatalErrorController = MockFatalErrorController();

      useCase = FatalErrorHandlerUseCase(mockFatalErrorController);
    });

    group('call', () {
      test('should call registered $FatalErrorHandler', () {
        final handler1 = MockFatalErrorHandler();
        final handler2 = MockFatalErrorHandler();
        mockFatalErrorController.mockRegisteredHandlers(
          [handler1, handler2],
        );

        useCase('test');

        verify(() => handler1.onFatalError('test')).called(1);
        verify(() => handler2.onFatalError('test')).called(1);
      });
    });
  });
}
