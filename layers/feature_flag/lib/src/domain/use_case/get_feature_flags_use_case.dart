import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:use_case/use_case.dart';

class GetFeatureFlagsUseCase
    extends BaseNoParamAsyncUseCase<Map<Feature, bool>, NoFailure> {
  GetFeatureFlagsUseCase(this._featureFlagRepository);

  final FeatureFlagRepository _featureFlagRepository;

  @override
  AsyncEither<NoFailure, Map<Feature, bool>> execute() async {
    try {
      final featureFlags = await _featureFlagRepository.getFeatureFlags();
      return Right(featureFlags);
    } catch (error, st) {
      reportError(error, st);
      return Left(NoFailure());
    }
  }
}
