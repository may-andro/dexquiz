import 'package:cache/cache.dart';

part 'color_cache_entity.g.dart';

@HiveType(typeId: 49)
class ColorCacheEntity extends BoxEntity {
  @HiveField(2)
  final int index;
  @HiveField(3)
  final String primary;
  @HiveField(4)
  final String secondary;

  ColorCacheEntity({
    required this.index,
    required this.primary,
    required this.secondary,
  }) : super(cachedTimestamp: 0, key: index.toString());
}
