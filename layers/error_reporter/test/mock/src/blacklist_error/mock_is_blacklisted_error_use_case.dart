import 'package:error_reporter/src/blacklist_error/is_blacklisted_error_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockIsBlacklistedErrorUseCase extends Mock
    implements IsBlacklistedErrorUseCase {
  void mockCall(bool expected) {
    when(() => call(any())).thenReturn(expected);
  }
}
