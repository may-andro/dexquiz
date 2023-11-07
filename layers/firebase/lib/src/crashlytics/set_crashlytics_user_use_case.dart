import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class SetCrashlyticsUserUseCase {
  SetCrashlyticsUserUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> call(String userId) {
    return _firebaseCrashlytics.setUserIdentifier(userId);
  }
}
