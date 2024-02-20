import 'package:cache/cache.dart';

part 'stat_cache_entity.g.dart';

@HiveType(typeId: 47)
class StatCacheEntity extends BoxEntity {
  @HiveField(2)
  final int baseStat;
  @HiveField(3)
  final int effort;
  @HiveField(4)
  final String name;

  StatCacheEntity({
    required this.baseStat,
    required this.effort,
    required this.name,
  }) : super(cachedTimestamp: 0, key: name);
}
