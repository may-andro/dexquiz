import 'package:error_reporter/src/blacklist_error/blacklist_error_handler.dart';
import 'package:mocktail/mocktail.dart';

class MockBlacklistErrorHandler extends Mock implements BlacklistErrorHandler {
  void mockIsBlacklistError(Object error, bool expected) {
    when(() => isBlacklistError(error)).thenReturn(expected);
  }
}
