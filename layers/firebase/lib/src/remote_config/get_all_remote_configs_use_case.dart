import 'package:firebase_remote_config/firebase_remote_config.dart';

class GetAllRemoteConfigsUseCase {
  GetAllRemoteConfigsUseCase(this._firebaseRemoteConfig);

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  Map<String, RemoteConfigValue> call() => _firebaseRemoteConfig.getAll();
}
