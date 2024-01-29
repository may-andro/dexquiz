import 'package:error_reporter/src/fatal_error/is_fatal_error_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockIsFatalErrorUseCase extends Mock implements IsFatalErrorUseCase {
  void mockCall(bool expected) {
    when(() => call(any())).thenReturn(expected);
  }
}
