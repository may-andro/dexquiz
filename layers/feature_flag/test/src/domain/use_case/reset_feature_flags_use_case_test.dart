import 'package:feature_flag/src/domain/use_case/reset_feature_flags_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:use_case/use_case.dart';

import '../../../_mock/src/domain/repository/mock_feature_flag_repository.dart';

void main() {
  group(ResetFeatureFlagsUseCase, () {
    late ResetFeatureFlagsUseCase resetFeatureFlagsUseCase;

    late MockFeatureFlagRepository mockFeatureFlagRepository;

    setUp(() {
      mockFeatureFlagRepository = MockFeatureFlagRepository();

      resetFeatureFlagsUseCase = ResetFeatureFlagsUseCase(
        mockFeatureFlagRepository,
      );
    });

    test('should return $Right when there is no error', () async {
      mockFeatureFlagRepository.mockReset();

      final result = await resetFeatureFlagsUseCase();

      expect(result.isRight, true);
    });

    test('should return $Left when there is no error', () async {
      mockFeatureFlagRepository.mockResetException();

      final result = await resetFeatureFlagsUseCase();

      expect(result.isLeft, true);
    });
  });
}
