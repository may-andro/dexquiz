import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:feature_flag/src/use_case/set_feature_enabled_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../_mock/src/cache/mock_feature_flag_cache.dart';

void main() {
  group(SetFeatureEnabledUseCase, () {
    late MockFeatureFlagCache mockFeatureFlagCache;

    late SetFeatureEnabledUseCase setFeatureEnabledUseCase;

    setUpAll(() {
      registerFallbackValue(
        FeatureFlagConfig(featureKey: 'test', isEnabled: true),
      );
    });

    setUp(() {
      mockFeatureFlagCache = MockFeatureFlagCache();

      setFeatureEnabledUseCase = SetFeatureEnabledUseCase(mockFeatureFlagCache);
    });

    test('should put in cache', () async {
      mockFeatureFlagCache.mockPut();

      final setFeatureEnabledParam = SetFeatureEnabledParam(
        Feature.inAppReview,
        isEnabled: false,
      );
      final result = await setFeatureEnabledUseCase(setFeatureEnabledParam);

      expect(result.isRight, true);
    });

    test('should handle error when occur', () async {
      mockFeatureFlagCache.mockPutException();

      final setFeatureEnabledParam = SetFeatureEnabledParam(
        Feature.inAppReview,
        isEnabled: false,
      );
      final result = await setFeatureEnabledUseCase(setFeatureEnabledParam);

      expect(result.isLeft, true);
    });
  });
}
