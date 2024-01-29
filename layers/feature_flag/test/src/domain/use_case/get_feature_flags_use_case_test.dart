import 'package:feature_flag/feature_flag.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:use_case/use_case.dart';

import '../../../_mock/src/domain/repository/mock_feature_flag_repository.dart';

void main() {
  group(GetFeatureFlagsUseCase, () {
    late GetFeatureFlagsUseCase getFeatureFlagsUseCase;

    late MockFeatureFlagRepository mockFeatureFlagRepository;

    setUp(() {
      mockFeatureFlagRepository = MockFeatureFlagRepository();

      getFeatureFlagsUseCase = GetFeatureFlagsUseCase(
        mockFeatureFlagRepository,
      );
    });

    test('should return map when cache is present', () async {
      final expected = <Feature, bool>{Feature.inAppReview: true};
      mockFeatureFlagRepository.mockGetFeatureFlags(expected);

      final result = await getFeatureFlagsUseCase();

      expect(result.isRight, true);
      expect(result.right, {Feature.inAppReview: true});
    });

    test('should return $Left when there is error', () async {
      mockFeatureFlagRepository.mockGetFeatureFlagsException();

      final result = await getFeatureFlagsUseCase();

      expect(result.isLeft, true);
      expect(result.left, isA<NoFailure>());
    });
  });
}
