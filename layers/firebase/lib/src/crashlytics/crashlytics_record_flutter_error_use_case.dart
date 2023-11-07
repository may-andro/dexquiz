import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsFlutterRecordErrorUseCase {
  CrashlyticsFlutterRecordErrorUseCase(this._firebaseCrashlytics);

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> call(FlutterErrorDetails error) {
    return _firebaseCrashlytics.recordFlutterError(error);
  }
}
