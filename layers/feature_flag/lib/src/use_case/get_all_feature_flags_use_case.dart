import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';
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
      return Right(featureFlagConfigs.featureMap);
    } on StateError {
      return const Left(NoKeyFoundFailure());
    } catch (error, st) {
      reportError(error, st);
      return const Left(UnknownFailure());
    }
  }
}

extension _FeatureFlagConfigExtension on List<FeatureFlagConfig> {
  Map<Feature, bool> get featureMap {
    final map = <Feature, bool>{};
    for (var featureFlagConfig in this) {
      final key = Feature.getFeature(featureFlagConfig.featureKey);
      map[key] = featureFlagConfig.isEnabled;
    }
    return map;
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
