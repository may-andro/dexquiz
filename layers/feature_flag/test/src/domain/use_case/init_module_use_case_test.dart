import 'package:feature_flag/src/domain/use_case/init_feature_flags_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:use_case/use_case.dart';

import '../../../_mock/src/domain/repository/mock_feature_flag_repository.dart';

void main() {
  group(InitFeatureFlagsUseCase, () {
    late InitFeatureFlagsUseCase initFeatureFlagsUseCase;

    late MockFeatureFlagRepository mockFeatureFlagRepository;

    setUp(() {
      mockFeatureFlagRepository = MockFeatureFlagRepository();

      initFeatureFlagsUseCase = InitFeatureFlagsUseCase(
        mockFeatureFlagRepository,
      );
    });

    group('call', () {
      test('should call $Right when there is no error', () async {
        mockFeatureFlagRepository.mockInitFeatureFlags();

        final result = await initFeatureFlagsUseCase();

        expect(result.isRight, true);
      });

      test('should handle error when occur', () async {
        mockFeatureFlagRepository.mockInitFeatureFlagsException();

        final result = await initFeatureFlagsUseCase();

        expect(result.isLeft, true);
      });
    });
  });
}
