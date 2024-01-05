import 'package:log_reporter/log_reporter.dart';
import 'package:mocktail/mocktail.dart';

class MockLogReporter extends Mock implements LogReporter {
  mockDebug() => when(() => debug(any())).thenReturn(null);
}
