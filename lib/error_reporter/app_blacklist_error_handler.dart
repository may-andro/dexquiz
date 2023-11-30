import 'package:dexquiz/error_reporter/blacklist_exception.dart';
import 'package:error_reporter/error_reporter.dart';

class AppBlacklistErrorHandler implements BlacklistErrorHandler {
  @override
  bool isBlacklistError(Object error) {
    return error is BlacklistException;
  }
}
