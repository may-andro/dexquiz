import 'package:error_reporter/src/blacklist_error/is_blacklisted_error_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/src/blacklist_error/mock_blacklist_error_controller.dart';
import '../../mock/src/blacklist_error/mock_blacklist_error_handler.dart';
import '../../mock/src/exception/test_app_exception.dart';

void main() {
  group(IsBlacklistedErrorUseCase, () {
    late IsBlacklistedErrorUseCase useCase;

    late MockBlacklistErrorController mockBlacklistErrorController;
    late MockBlacklistErrorHandler mockBlacklistErrorHandler;

    setUp(() {
      mockBlacklistErrorController = MockBlacklistErrorController();
      mockBlacklistErrorHandler = MockBlacklistErrorHandler();

      useCase = IsBlacklistedErrorUseCase(mockBlacklistErrorController);
    });

    group('call', () {
      setUp(() {
        mockBlacklistErrorController.mockRegisteredHandlers(
          [mockBlacklistErrorHandler],
        );
      });

      test('should return false when the error is not registered', () {
        final testError = TestAppException();
        mockBlacklistErrorHandler.mockIsBlacklistError(testError, false);

        final result = useCase(testError);

        expect(result, false);
      });

      test('should return true when the error is not registered', () {
        final testError = TestAppException();
        mockBlacklistErrorHandler.mockIsBlacklistError(testError, true);

        final result = useCase(testError);

        expect(result, true);
      });
    });
  });
}
