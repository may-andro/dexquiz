import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:feature_flag/src/use_case/get_all_feature_flags_use_case.dart';
import 'package:feature_flag/src/use_case/is_feature_enabled_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../_mock/src/cache/mock_feature_flag_cache.dart';

void main() {
  group(GetAllFeatureFlagsUseCase, () {
    late MockFeatureFlagCache mockFeatureFlagCache;

    late IsFeatureEnabledUseCase isFeatureEnabledUseCase;

    setUp(() {
      mockFeatureFlagCache = MockFeatureFlagCache();

      isFeatureEnabledUseCase = IsFeatureEnabledUseCase(mockFeatureFlagCache);
    });

    test('should return true when cache is true', () async {
      final featureFlagsConfig = FeatureFlagConfig(
        featureKey: Feature.inAppReview.key,
        isEnabled: true,
      );
      mockFeatureFlagCache.mockGet(featureFlagsConfig);

      final result = await isFeatureEnabledUseCase(Feature.inAppReview);

      expect(result.isRight, true);
      expect(result.right, true);
    });

    test('should return false when cache is false', () async {
      final featureFlagsConfig = FeatureFlagConfig(
        featureKey: Feature.inAppReview.key,
        isEnabled: false,
      );
      mockFeatureFlagCache.mockGet(featureFlagsConfig);

      final result = await isFeatureEnabledUseCase(Feature.inAppReview);

      expect(result.isRight, true);
      expect(result.right, false);
    });

    test('should catch error when occur', () async {
      mockFeatureFlagCache.mockGetException();

      final result = await isFeatureEnabledUseCase(Feature.inAppReview);

      expect(result.isLeft, true);
    });
  });
}
