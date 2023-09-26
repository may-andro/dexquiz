import 'package:logger/logger.dart';

abstract class Log {
  void i(String message);

  void d(String message);

  void e(String message, {Object? error, StackTrace? stackTrace});
}

class LogImpl implements Log {
  LogImpl(this._logger);

  final Logger _logger;

  @override
  void i(String message) {
    print(message);
    _logger.i(message);
  }

  @override
  void d(String message) {
    print(message);
    _logger.d(message);
  }

  @override
  void e(String message, {Object? error, StackTrace? stackTrace}) {
    print(message);
    return _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
