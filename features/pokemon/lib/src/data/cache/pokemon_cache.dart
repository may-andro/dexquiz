import 'package:cache/cache.dart';
import 'package:pokemon/src/data/entity/local/pokemon_cache_entity.dart';

class PokemonCache extends DBCache<PokemonCacheEntity> {
  PokemonCache(super.box);
}