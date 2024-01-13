import 'package:firebase_analytics/firebase_analytics.dart';

class SetUserUseCase {
  SetUserUseCase(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  Future<void> call(
    String userId, {
    Map<String, String>? additionalProps,
  }) async {
    _firebaseAnalytics.setUserId(id: userId);
    if (additionalProps != null && additionalProps.isNotEmpty) {
      additionalProps.forEach((key, value) {
        _firebaseAnalytics.setUserProperty(name: key, value: value);
      });
    }
  }
}
