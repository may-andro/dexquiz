import 'package:cache/cache.dart';
import 'package:feature_flag/src/data/cache/feature_flag_config.dart';

class FeatureFlagCache extends DBCache<FeatureFlagConfig> {
  FeatureFlagCache(super.box);
}
