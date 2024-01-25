import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:use_case/use_case.dart';

class IsFeatureEnabledUseCase
    extends BaseAsyncUseCase<bool, Feature, UnknownFailure> {
  IsFeatureEnabledUseCase(this._featureFlagRepository);

  final FeatureFlagRepository _featureFlagRepository;

  @override
  AsyncEither<UnknownFailure, bool> execute(Feature feature) async {
    try {
      final status = await _featureFlagRepository.getFeatureFlagStatus(feature);
      return Right(status);
    } on Exception catch (e, st) {
      reportError(e, st);
      return Left(UnknownFailure());
    }
  }
}
