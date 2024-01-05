import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/model/feature.dart';
import 'package:use_case/use_case.dart';

class GetAllFeatureFlagsUseCase extends BaseNoParamAsyncUseCase<
    Map<Feature, bool>, GetAllFeatureFlagsFailure> {
  GetAllFeatureFlagsUseCase(this._featureFlagCache);

  final FeatureFlagCache _featureFlagCache;

  @override
  AsyncEither<GetAllFeatureFlagsFailure, Map<Feature, bool>> execute() async {
    try {
      final featureFlagConfigs = await _featureFlagCache.all;
      final map = <Feature, bool>{};
      for (var featureFlagConfig in featureFlagConfigs) {
        map[Feature.getFeature(featureFlagConfig.featureKey)] =
            featureFlagConfig.isEnabled;
      }
      return Right(map);
    } on StateError {
      return const Left(NoKeyFoundFailure());
    } catch (error, st) {
      reportError(error, st);
      return const Left(UnknownFailure());
    }
  }
}

sealed class GetAllFeatureFlagsFailure extends BasicFailure {
  const GetAllFeatureFlagsFailure({super.message, super.cause});
}

class NoKeyFoundFailure extends GetAllFeatureFlagsFailure {
  static const _message = 'Unknown key found';

  const NoKeyFoundFailure() : super(message: _message);
}

class UnknownFailure extends GetAllFeatureFlagsFailure {
  static const _message = 'Unknown error';

  const UnknownFailure() : super(message: _message);
}
