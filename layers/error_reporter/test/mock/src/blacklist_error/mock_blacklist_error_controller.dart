import 'package:error_reporter/src/blacklist_error/blacklist_error_controller.dart';
import 'package:error_reporter/src/blacklist_error/blacklist_error_handler.dart';
import 'package:mocktail/mocktail.dart';

class MockBlacklistErrorController extends Mock
    implements BlacklistErrorController {
  void mockRegisteredHandlers(List<BlacklistErrorHandler> expected) {
    when(() => registeredHandlers).thenReturn(expected);
  }

  void mockRegisterThrowsError() {
    when(() => register(any())).thenThrow(Exception());
  }
}
