import 'package:log_reporter/src/log_reporter.dart';

class LocalLogReporter implements LogReporter {
  @override
  Future<void> debug(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    // TODO: implement debug
    throw UnimplementedError();
  }

  @override
  Future<void> error(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    // TODO: implement error
    throw UnimplementedError();
  }
}
