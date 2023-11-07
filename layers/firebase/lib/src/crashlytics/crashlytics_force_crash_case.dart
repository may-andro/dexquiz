import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsForceCrashUseCase {
  CrashlyticsForceCrashUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  void call() => _firebaseCrashlytics.crash();
}
