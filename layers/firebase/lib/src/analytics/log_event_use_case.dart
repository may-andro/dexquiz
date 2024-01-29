import 'package:firebase_analytics/firebase_analytics.dart';

class LogEventUseCase {
  LogEventUseCase(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  Future<void> call(String event, {Map<String, dynamic>? parameters}) {
    return _firebaseAnalytics.logEvent(name: event, parameters: parameters);
  }
}
