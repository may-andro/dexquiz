import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/use_case/is_feature_enabled_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../_mock/src/domain/repository/mock_feature_flag_repository.dart';

void main() {
  group(IsFeatureEnabledUseCase, () {
    late MockFeatureFlagRepository mockFeatureFlagRepository;

    late IsFeatureEnabledUseCase isFeatureEnabledUseCase;

    setUpAll(() {
      registerFallbackValue(Feature.inAppReview);
    });

    setUp(() {
      mockFeatureFlagRepository = MockFeatureFlagRepository();

      isFeatureEnabledUseCase = IsFeatureEnabledUseCase(
        mockFeatureFlagRepository,
      );
    });

    test('should return Right when there is no error', () async {
      mockFeatureFlagRepository.mockGetFeatureFlagStatus(true);

      final result = await isFeatureEnabledUseCase(Feature.inAppReview);

      expect(result.isRight, true);
      expect(result.right, true);
    });

    test('should return Left when there is error', () async {
      mockFeatureFlagRepository.mockGetFeatureFlagStatusException();

      final result = await isFeatureEnabledUseCase(Feature.inAppReview);

      expect(result.isLeft, true);
    });
  });
}
