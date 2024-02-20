import 'package:cache/cache.dart';

part 'favorite_cache_entity.g.dart';

@HiveType(typeId: 45)
class FavoriteCacheEntity extends BoxEntity {
  @HiveField(2)
  final int index;
  @HiveField(3)
  final bool isFavorite;

  FavoriteCacheEntity({
    required this.index,
    required this.isFavorite,
  }) : super(cachedTimestamp: 0, key: index.toString());
}
