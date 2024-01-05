import 'package:cache/cache.dart';

part 'feature_flag_config.g.dart';

@HiveType(typeId: 90)
class FeatureFlagConfig extends BoxEntity {
  @HiveField(2)
  final String featureKey;
  @HiveField(3)
  final bool isEnabled;

  FeatureFlagConfig({
    required this.featureKey,
    required this.isEnabled,
  }) : super(cachedTimestamp: 0, key: featureKey);
}
