import 'package:error_reporter/src/blacklist_error/blacklist_error_controller.dart';
import 'package:error_reporter/src/exception/handler_registered_exception.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/src/blacklist_error/mock_blacklist_error_handler.dart';

void main() {
  group(BlacklistErrorController, () {
    late BlacklistErrorController controller;

    setUp(() {
      controller = BlacklistErrorController();
    });

    group('register', () {
      test('should register handlers', () {
        final handler1 = MockBlacklistErrorHandler();
        final handler2 = MockBlacklistErrorHandler();

        controller.register(handler1);
        controller.register(handler2);

        expect(controller.registeredHandlers, contains(handler1));
        expect(controller.registeredHandlers, contains(handler2));
        expect(controller.registeredHandlers.length, 2);
      });

      test('should not register duplicate handlers', () {
        final handler = MockBlacklistErrorHandler();

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
        final handler = MockBlacklistErrorHandler();

        controller.register(handler);

        expect(controller.registeredHandlers.length, 1);
      });
    });
  });
}
