import 'package:cache/cache.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';

class FeatureFlagCache extends DBCache<FeatureFlagConfig> {
  FeatureFlagCache(super.box);
}
