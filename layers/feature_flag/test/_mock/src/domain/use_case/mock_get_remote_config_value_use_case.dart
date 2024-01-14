import 'package:firebase/firebase.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRemoteConfigValueUseCase extends Mock
    implements GetRemoteConfigValueUseCase {
  mockCall(RemoteConfigValue remoteConfigValue) {
    when(() => call(any())).thenReturn(remoteConfigValue);
  }
}
