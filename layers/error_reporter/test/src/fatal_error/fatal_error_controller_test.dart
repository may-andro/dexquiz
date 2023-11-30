import 'package:error_reporter/src/exception/handler_registered_exception.dart';
import 'package:error_reporter/src/fatal_error/fatal_error_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/src/fatal_error/mock_fatal_exception_handler.dart';

void main() {
  group(FatalErrorController, () {
    late FatalErrorController controller;

    setUp(() {
      controller = FatalErrorController();
    });

    group('register', () {
      test('should register handlers', () {
        final handler1 = MockFatalErrorHandler();
        final handler2 = MockFatalErrorHandler();

        controller.register(handler1);
        controller.register(handler2);

        expect(controller.registeredHandlers, contains(handler1));
        expect(controller.registeredHandlers, contains(handler2));
        expect(controller.registeredHandlers.length, 2);
      });

      test('should not register duplicate handlers', () {
        final handler = MockFatalErrorHandler();

        controller.register(handler);

        expect(controller.registeredHandlers.length, 1);
        expect(
          () => controller.register(handler),
          throwsA(isA<HandlerRegisteredException>()),
        );
      });
    });

    group('registeredHandlers', () {
      test('should have no handlers by default', () {
        expect(controller.registeredHandlers.length, 0);
      });

      test('should return the register handlers', () {
        final handler = MockFatalErrorHandler();

        controller.register(handler);

        expect(controller.registeredHandlers.length, 1);
      });
    });
  });
}
