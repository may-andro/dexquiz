import 'package:firebase_analytics/firebase_analytics.dart';

class SetDefaultParamsToEventUseCase {
  SetDefaultParamsToEventUseCase(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  Future<void> call(Map<String, dynamic>? parameters) {
    return _firebaseAnalytics.setDefaultEventParameters(parameters);
  }
}
