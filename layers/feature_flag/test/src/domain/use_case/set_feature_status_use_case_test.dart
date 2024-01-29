import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/use_case/set_feature_status_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../_mock/src/domain/repository/mock_feature_flag_repository.dart';

void main() {
  group(SetFeatureFlagStatusUseCase, () {
    late SetFeatureFlagStatusUseCase setFeatureFlagStatusUseCase;

    late MockFeatureFlagRepository mockFeatureFlagRepository;

    setUpAll(() {
      registerFallbackValue(Feature.inAppReview);
    });

    setUp(() {
      mockFeatureFlagRepository = MockFeatureFlagRepository();

      setFeatureFlagStatusUseCase = SetFeatureFlagStatusUseCase(
        mockFeatureFlagRepository,
      );

      mockFeatureFlagRepository.mockEnableFeatureFlag();
      mockFeatureFlagRepository.mockDisableFeatureFlag();
    });

    test('should disable when param contains false', () async {
      await setFeatureFlagStatusUseCase(
        SetFeatureFlagStatusParam(Feature.inAppReview, isEnabled: false),
      );

      verify(
        () => mockFeatureFlagRepository.disableFeatureFlag(any()),
      ).called(1);
    });

    test('should enable when param contains true', () async {
      await setFeatureFlagStatusUseCase(
        SetFeatureFlagStatusParam(Feature.inAppReview, isEnabled: true),
      );

      verify(
        () => mockFeatureFlagRepository.enableFeatureFlag(any()),
      ).called(1);
    });
  });
}
