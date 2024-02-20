import 'package:pokemon/src/data/cache/cache.dart';
import 'package:pokemon/src/data/entity/local/description_cache_entity.dart';
import 'package:pokemon/src/data/mapper/pokemon_cache_entity_mapper.dart';
import 'package:pokemon/src/data/mapper/pokemon_mapper.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';

class CachedPokemonRepository implements PokemonRepository {
  CachedPokemonRepository(
    this._pokemonCache,
    this._descriptionCache,
  );

  final PokemonCache _pokemonCache;
  final DescriptionCache _descriptionCache;

  @override
  Future<List<Pokemon>> fetchPokedex(String flavor) async {
    final pokemons = await _pokemonCache.all;
    return pokemons.map((cachedEntity) => cachedEntity.toPokemon()).toList();
  }

  @override
  Future<Pokemon?> fetchPokemon(int index) async {
    final cachedEntity = await _pokemonCache.get(index.toString());
    return cachedEntity?.toPokemon();
  }

  @override
  Future<String?> fetchPokemonDescription(int index) async {
    final cachedEntity = await _descriptionCache.get(index.toString());
    return cachedEntity?.description;
  }

  Future<void> setPokemonCache(List<Pokemon> pokemons) {
    final entities =
        pokemons.map((pokemon) => pokemon.toCacheEntity()).toList();
    return _pokemonCache.putAll(entities);
  }

  Future<void> setDescriptionCache(int index, String description) {
    final cacheEntity = DescriptionCacheEntity(
      index: index,
      description: description,
    );
    return _descriptionCache.put(cacheEntity);
  }
}
