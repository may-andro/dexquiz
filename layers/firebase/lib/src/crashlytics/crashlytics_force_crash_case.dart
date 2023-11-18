import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsForceCrashUseCase {
  CrashlyticsForceCrashUseCase(
    this._firebaseCrashlytics,
    this._isCrashlyticsEnabledUseCase,
  );

  final FirebaseCrashlytics _firebaseCrashlytics;
  final IsCrashlyticsEnabledUseCase _isCrashlyticsEnabledUseCase;

  void call() {
    if (!_isCrashlyticsEnabledUseCase()) {
      return;
    }
    _firebaseCrashlytics.crash();
  }
}
