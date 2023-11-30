import 'package:error_reporter/src/fatal_error/fatal_error_controller.dart';
import 'package:error_reporter/src/fatal_error/fatal_error_handler.dart';
import 'package:mocktail/mocktail.dart';

class MockFatalErrorController extends Mock implements FatalErrorController {
  void mockRegisteredHandlers(List<FatalErrorHandler> expected) {
    when(() => registeredHandlers).thenReturn(expected);
  }

  void mockRegisterThrowsError() {
    when(() => register(any())).thenThrow(Exception());
  }
}
