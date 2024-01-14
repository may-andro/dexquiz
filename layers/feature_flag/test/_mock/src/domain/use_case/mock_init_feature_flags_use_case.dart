import 'package:feature_flag/src/domain/use_case/init_feature_flags_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockInitFeatureFlagsUseCase extends Mock
    implements InitFeatureFlagsUseCase {
  mockCall() => when(call).thenAnswer((_) async => const Right(null));
}
