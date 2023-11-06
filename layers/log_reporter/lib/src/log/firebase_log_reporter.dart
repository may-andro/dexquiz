import 'package:log_reporter/src/log/log_reporter.dart';

class FirebaseLogReporter implements LogReporter {
  @override
  void debug(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    // TODO: implement debug
    throw UnimplementedError();
  }

  @override
  void error(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    // TODO: implement error
    throw UnimplementedError();
  }
}
