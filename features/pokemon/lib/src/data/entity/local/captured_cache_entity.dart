import 'package:cache/cache.dart';

part 'captured_cache_entity.g.dart';

@HiveType(typeId: 44)
class CapturedCacheEntity extends BoxEntity {
  @HiveField(2)
  final int index;
  @HiveField(3)
  final bool isCaptured;

  CapturedCacheEntity({
    required this.index,
    required this.isCaptured,
  }) : super(cachedTimestamp: 0, key: index.toString());
}
