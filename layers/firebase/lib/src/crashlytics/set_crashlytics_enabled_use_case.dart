import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class SetCrashlyticsEnabledUseCase {
  SetCrashlyticsEnabledUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> call(bool isEnabled) {
    return _firebaseCrashlytics.setCrashlyticsCollectionEnabled(isEnabled);
  }
}
