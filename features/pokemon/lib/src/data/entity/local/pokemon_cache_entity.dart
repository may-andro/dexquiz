import 'package:cache/cache.dart';
import 'package:pokemon/src/data/entity/local/stat_cache_entity.dart';

part 'pokemon_cache_entity.g.dart';

@HiveType(typeId: 46)
class PokemonCacheEntity extends BoxEntity {
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final int baseExperience;
  @HiveField(5)
  final int height;
  @HiveField(6)
  final int weight;
  @HiveField(7)
  final List<String> abilities;
  @HiveField(8)
  final List<String> moves;
  @HiveField(9)
  final String image;
  @HiveField(10)
  final List<StatCacheEntity> stats;
  @HiveField(11)
  final List<String> types;

  PokemonCacheEntity({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.moves,
    required this.image,
    required this.stats,
    required this.types,
  }) : super(cachedTimestamp: 0, key: id.toString());
}
