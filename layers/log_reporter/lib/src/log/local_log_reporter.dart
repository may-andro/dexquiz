import 'package:log_reporter/src/log/log_reporter.dart';
import 'package:logger/logger.dart';

class LocalLogReporter implements LogReporter {
  LocalLogReporter(this._logger);

  final Logger _logger;

  @override
  void debug(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    _logger.d(message, error: error, stackTrace: stacktrace);
  }

  @override
  void error(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    _logger.e(message, error: error, stackTrace: stacktrace);
  }
}
