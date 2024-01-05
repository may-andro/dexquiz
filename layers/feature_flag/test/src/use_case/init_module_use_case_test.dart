import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:feature_flag/src/use_case/init_module_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../_mock/src/cache/mock_feature_flag_cache.dart';
import '../../_mock/src/use_case/mock_init_module_use_case.dart';
import '../../_mock/src/util/mock_log_reporter.dart';

void main() {
  group(InitModuleUseCase, () {
    late InitModuleUseCase initModuleUseCase;

    late MockFeatureFlagCache mockFeatureFlagCache;
    late MockUpdateCacheUseCase mockUpdateCacheUseCase;
    late MockLogReporter mockLogReporter;

    setUp(() {
      mockFeatureFlagCache = MockFeatureFlagCache();
      mockUpdateCacheUseCase = MockUpdateCacheUseCase();
      mockLogReporter = MockLogReporter();

      initModuleUseCase = InitModuleUseCase(
        mockUpdateCacheUseCase,
        mockFeatureFlagCache,
        mockLogReporter,
      );
    });

    group('call', () {
      test('should update cache when empty', () async {
        mockFeatureFlagCache.mockAll([]);
        mockLogReporter.mockDebug();
        mockUpdateCacheUseCase.mockCall();

        final result = await initModuleUseCase();

        verify(() => mockUpdateCacheUseCase.call()).called(1);
        expect(result.isRight, true);
      });

      test('should do nothing when cache exists', () {
        final featureFlagsConfigs = [
          FeatureFlagConfig(
              featureKey: Feature.inAppReview.key, isEnabled: true)
        ];
        mockFeatureFlagCache.mockAll(featureFlagsConfigs);
        mockLogReporter.mockDebug();
        mockUpdateCacheUseCase.mockCall();

        initModuleUseCase();

        verifyNever(() => mockUpdateCacheUseCase.call());
      });

      test('should handle error when occur', () async {
        mockFeatureFlagCache.mockAllException();
        mockLogReporter.mockDebug();
        mockUpdateCacheUseCase.mockCall();

        final result = await initModuleUseCase();

        expect(result.isLeft, true);
      });
    });
  });
}
