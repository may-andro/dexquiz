import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/use_case/update_cache_use_case.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../_mock/src/cache/mock_feature_flag_cache.dart';
import '../../_mock/src/use_case/mock_get_remote_config_value_use_case.dart';

void main() {
  group(UpdateCacheUseCase, () {
    late UpdateCacheUseCase updateCacheUseCase;

    late MockFeatureFlagCache mockFeatureFlagCache;
    late MockGetRemoteConfigValueUseCase mockGetRemoteConfigValueUseCase;

    setUpAll(() {
      registerFallbackValue(
        FeatureFlagConfig(featureKey: 'test', isEnabled: true),
      );
    });

    setUp(() {
      mockFeatureFlagCache = MockFeatureFlagCache();
      mockGetRemoteConfigValueUseCase = MockGetRemoteConfigValueUseCase();

      updateCacheUseCase = UpdateCacheUseCase(
        mockGetRemoteConfigValueUseCase,
        mockFeatureFlagCache,
      );
    });

    test('should delete and update cache', () async {
      mockFeatureFlagCache.mockDeleteAll();
      mockFeatureFlagCache.mockPutAll();
      mockGetRemoteConfigValueUseCase.mockCall(
        RemoteConfigValue([], ValueSource.valueDefault),
      );

      final result = await updateCacheUseCase();

      expect(result.isRight, true);
    });

    test('should handle error when occur', () async {
      mockFeatureFlagCache.mockDeleteAll();
      mockFeatureFlagCache.mockPutAllException();
      mockGetRemoteConfigValueUseCase.mockCall(
        RemoteConfigValue([], ValueSource.valueDefault),
      );

      final result = await updateCacheUseCase();

      expect(result.isLeft, true);
    });
  });
}
