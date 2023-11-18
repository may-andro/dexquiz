import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class IsCrashlyticsEnabledUseCase {
  IsCrashlyticsEnabledUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  bool call() => _firebaseCrashlytics.isCrashlyticsCollectionEnabled;
}
