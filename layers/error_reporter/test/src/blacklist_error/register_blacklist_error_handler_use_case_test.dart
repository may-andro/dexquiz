import 'package:error_reporter/src/blacklist_error/blacklist_error_controller.dart';
import 'package:error_reporter/src/blacklist_error/blacklist_error_handler.dart';
import 'package:error_reporter/src/blacklist_error/register_blacklist_error_handler_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

import '../../mock/src/blacklist_error/mock_blacklist_error_controller.dart';
import '../../mock/src/blacklist_error/mock_blacklist_error_handler.dart';

class FakedBlacklistErrorHandler extends Fake
    implements BlacklistErrorHandler {}

void main() {
  group(RegisterBlacklistErrorHandlerUseCase, () {
    late RegisterBlacklistErrorHandlerUseCase useCase;

    late MockBlacklistErrorController mockBlacklistErrorController;
    late MockBlacklistErrorHandler mockBlacklistErrorHandler;

    setUpAll(() {
      registerFallbackValue(FakedBlacklistErrorHandler());
    });

    setUp(() {
      mockBlacklistErrorController = MockBlacklistErrorController();
      mockBlacklistErrorHandler = MockBlacklistErrorHandler();

      useCase = RegisterBlacklistErrorHandlerUseCase(
        mockBlacklistErrorController,
      );
    });

    group('call', () {
      test(
        'should register the $BlacklistErrorHandler in $BlacklistErrorController',
        () {
          final result = useCase(mockBlacklistErrorHandler);

          expect(result, isA<Right<NoFailure, void>>());
          verify(
            () => mockBlacklistErrorController
                .register(mockBlacklistErrorHandler),
          ).called(1);
        },
      );

      test(
        'should return $Left on exception',
        () {
          mockBlacklistErrorController.mockRegisterThrowsError();

          final result = useCase(mockBlacklistErrorHandler);

          expect(result, isA<Left<NoFailure, void>>());
        },
      );
    });
  });
}
