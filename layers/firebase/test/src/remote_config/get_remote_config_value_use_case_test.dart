import 'package:firebase/src/remote_config/get_remote_config_value_use_case.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../_mock/mock_firebase_remote_config.dart';

void main() {
  group(GetRemoteConfigValueUseCase, () {
    late GetRemoteConfigValueUseCase getRemoteConfigValueUseCase;

    late MockFirebaseRemoteConfig mockFirebaseRemoteConfig;

    setUp(() {
      mockFirebaseRemoteConfig = MockFirebaseRemoteConfig();

      getRemoteConfigValueUseCase = GetRemoteConfigValueUseCase(
        mockFirebaseRemoteConfig,
      );
    });

    group('call', () {
      test('should return $RemoteConfigValue', () {
        final remoteConfig = RemoteConfigValue(null, ValueSource.valueStatic);
        mockFirebaseRemoteConfig.mockGetValue(remoteConfig);

        final result = getRemoteConfigValueUseCase.call('');

        verify(() => mockFirebaseRemoteConfig.getValue('')).called(1);
        expect(result, remoteConfig);
      });
    });
  });
}
