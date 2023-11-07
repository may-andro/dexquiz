import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsLogUseCase {
  CrashlyticsLogUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> call(String message) => _firebaseCrashlytics.log(message);
}
