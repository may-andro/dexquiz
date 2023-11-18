import 'package:firebase/firebase.dart';
import 'package:log_reporter/src/log/log_reporter.dart';

class FirebaseLogReporter implements LogReporter {
  FirebaseLogReporter(this._crashlyticsLogUseCase);

  final CrashlyticsLogUseCase _crashlyticsLogUseCase;

  @override
  void debug(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    _logMessage('[$tag] $message');
  }

  @override
  void error(
    String message, {
    String? tag,
    error,
    StackTrace? stacktrace,
  }) {
    _logMessage('[$tag] $message');
  }

  void _logMessage(String message) => _crashlyticsLogUseCase(message);
}
