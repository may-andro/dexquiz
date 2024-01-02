import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseRemoteConfig extends Mock implements FirebaseRemoteConfig {
  void mockGetValue(RemoteConfigValue expected) {
    when(() => getValue(any())).thenReturn(expected);
  }

  void mockError() {
    when(() => getValue(any())).thenThrow(Exception());
  }
}
