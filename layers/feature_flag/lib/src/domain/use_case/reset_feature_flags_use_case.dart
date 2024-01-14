import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:use_case/use_case.dart';

class ResetFeatureFlagsUseCase
    extends BaseNoParamAsyncUseCase<void, NoFailure> {
  ResetFeatureFlagsUseCase(
    this._featureFlagRepository,
  );

  final FeatureFlagRepository _featureFlagRepository;

  @override
  AsyncEither<NoFailure, void> execute() async {
    try {
      await _featureFlagRepository.reset();
      return const Right(null);
    } on Exception catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
