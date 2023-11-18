import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsLogUseCase {
  CrashlyticsLogUseCase(
    this._firebaseCrashlytics,
    this._isCrashlyticsEnabledUseCase,
  );

  final FirebaseCrashlytics _firebaseCrashlytics;
  final IsCrashlyticsEnabledUseCase _isCrashlyticsEnabledUseCase;

  Future<void> call(String message) {
    if (!_isCrashlyticsEnabledUseCase()) {
      return Future.value();
    }
    return _firebaseCrashlytics.log(message);
  }
}
