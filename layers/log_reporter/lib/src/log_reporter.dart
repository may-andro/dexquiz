abstract class LogReporter {
  Future<void> debug(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stacktrace,
  });

  Future<void> error(
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stacktrace,
  });
}
