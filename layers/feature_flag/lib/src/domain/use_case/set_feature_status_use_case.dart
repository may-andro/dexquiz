import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:use_case/use_case.dart';

class SetFeatureFlagStatusParam {
  SetFeatureFlagStatusParam(this.feature, {required this.isEnabled});

  Feature feature;
  bool isEnabled;
}

class SetFeatureFlagStatusUseCase
    extends BaseAsyncUseCase<void, SetFeatureFlagStatusParam, NoFailure> {
  SetFeatureFlagStatusUseCase(this._featureFlagRepository);

  final FeatureFlagRepository _featureFlagRepository;

  @override
  AsyncEither<NoFailure, void> execute(SetFeatureFlagStatusParam param) async {
    try {
      if (param.isEnabled) {
        _featureFlagRepository.enableFeatureFlag(param.feature);
      } else {
        _featureFlagRepository.disableFeatureFlag(param.feature);
      }
      return const Right(null);
    } on Exception catch (e, st) {
      reportError(e, st);
      return Left(NoFailure());
    }
  }
}
