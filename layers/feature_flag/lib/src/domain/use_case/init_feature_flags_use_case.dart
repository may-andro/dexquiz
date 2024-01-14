import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:use_case/use_case.dart';

class InitFeatureFlagsUseCase extends BaseNoParamAsyncUseCase<void, NoFailure> {
  InitFeatureFlagsUseCase(this._featureFlagRepository);

  final FeatureFlagRepository _featureFlagRepository;

  @override
  AsyncEither<NoFailure, void> execute() async {
    try {
      await _featureFlagRepository.initFeatureFlags();
      return const Right(null);
    } catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
