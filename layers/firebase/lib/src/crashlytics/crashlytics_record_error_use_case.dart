import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsRecordErrorUseCase {
  CrashlyticsRecordErrorUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> call(
    Object error,
    StackTrace? stackTrace, {
    bool isFatal = false,
  }) {
    return _firebaseCrashlytics.recordError(
      error,
      stackTrace,
      fatal: isFatal,
    );
  }
}
