import 'package:firebase/src/remote_config/remote_configs.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class InitialiseRemoteConfigUseCase {
  InitialiseRemoteConfigUseCase(this._firebaseRemoteConfig);

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  Future<void> call() async {
    await _firebaseRemoteConfig.setDefaults(RemoteConfigs.defaultConfigsMap);
    await _firebaseRemoteConfig.fetchAndActivate();
  }
}
