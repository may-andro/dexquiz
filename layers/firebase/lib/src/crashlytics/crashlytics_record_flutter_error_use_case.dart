import 'package:firebase/src/crashlytics/crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsFlutterRecordErrorUseCase {
  CrashlyticsFlutterRecordErrorUseCase(
    this._firebaseCrashlytics,
    this._isCrashlyticsEnabledUseCase,
  );

  final FirebaseCrashlytics _firebaseCrashlytics;
  final IsCrashlyticsEnabledUseCase _isCrashlyticsEnabledUseCase;

  Future<void> call(FlutterErrorDetails error) {
    if (!_isCrashlyticsEnabledUseCase()) {
      return Future.value();
    }
    return _firebaseCrashlytics.recordFlutterError(error);
  }
}
