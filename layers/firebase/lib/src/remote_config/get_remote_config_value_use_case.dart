import 'package:firebase_remote_config/firebase_remote_config.dart';

class GetRemoteConfigValueUseCase {
  GetRemoteConfigValueUseCase(this._firebaseRemoteConfig);

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  RemoteConfigValue call(String input) => _firebaseRemoteConfig.getValue(input);
}
