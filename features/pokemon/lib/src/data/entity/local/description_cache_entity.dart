import 'package:cache/cache.dart';

part 'description_cache_entity.g.dart';

@HiveType(typeId: 48)
class DescriptionCacheEntity extends BoxEntity {
  @HiveField(2)
  final int index;
  @HiveField(3)
  final String description;

  DescriptionCacheEntity({
    required this.index,
    required this.description,
  }) : super(cachedTimestamp: 0, key: index.toString());
}
