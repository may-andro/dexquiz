import 'package:feature_flag/feature_flag.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../_mock/src/cache/mock_feature_flag_cache.dart';

void main() {
  group(GetAllFeatureFlagsUseCase, () {
    late GetAllFeatureFlagsUseCase getAllFeatureFlagsUseCase;

    late MockFeatureFlagCache mockFeatureFlagCache;

    setUp(() {
      mockFeatureFlagCache = MockFeatureFlagCache();

      getAllFeatureFlagsUseCase =
          GetAllFeatureFlagsUseCase(mockFeatureFlagCache);
    });

    test('should return map when cache is present', () async {
      final featureFlagsConfigs = [
        FeatureFlagConfig(featureKey: Feature.inAppReview.key, isEnabled: true)
      ];
      mockFeatureFlagCache.mockAll(featureFlagsConfigs);

      final result = await getAllFeatureFlagsUseCase();

      expect(result.isRight, true);
      expect(result.right, {Feature.inAppReview: true});
    });

    test('should cache return $NoKeyFoundFailure when key is unknown',
        () async {
      final featureFlagsConfigs = [
        FeatureFlagConfig(featureKey: 'key', isEnabled: true)
      ];
      mockFeatureFlagCache.mockAll(featureFlagsConfigs);

      final result = await getAllFeatureFlagsUseCase();

      expect(result.isLeft, true);
      expect(result.left, isA<NoKeyFoundFailure>());
    });

    test('should return map when cache is present', () async {
      mockFeatureFlagCache.mockAllException();

      final result = await getAllFeatureFlagsUseCase();

      expect(result.isLeft, true);
      expect(result.left, isA<UnknownFailure>());
    });
  });
}
