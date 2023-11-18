import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsRecordErrorUseCase {
  CrashlyticsRecordErrorUseCase(
    this._firebaseCrashlytics,
    this._isCrashlyticsEnabledUseCase,
  );

  final FirebaseCrashlytics _firebaseCrashlytics;
  final IsCrashlyticsEnabledUseCase _isCrashlyticsEnabledUseCase;

  Future<void> call(
    Object error,
    StackTrace? stackTrace, {
    bool isFatal = false,
  }) {
    if (!_isCrashlyticsEnabledUseCase()) {
      return Future.value();
    }
    return _firebaseCrashlytics.recordError(
      error,
      stackTrace,
      fatal: isFatal,
    );
  }
}
