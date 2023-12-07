import 'package:error_reporter/src/fatal_error/fatal_exception_handler_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockFatalErrorHandlerUseCase extends Mock
    implements FatalErrorHandlerUseCase {
  void mockCall() {
    when(() => call(any())).thenAnswer((_) => Future.value());
  }
}
