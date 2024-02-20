import 'package:pokemon/src/data/cache/captured_cache.dart';
import 'package:pokemon/src/data/entity/local/captured_cache_entity.dart';
import 'package:pokemon/src/domain/repository/captured_pokemon_repository.dart';

class CapturedPokemonRepositoryImpl implements CapturedPokemonRepository {
  CapturedPokemonRepositoryImpl(this._capturedCache);

  final CapturedCache _capturedCache;

  @override
  Future<void> addToCaptured(int index) {
    final cacheEntity = CapturedCacheEntity(
      index: index,
      isCaptured: true,
    );
    return _capturedCache.put(cacheEntity);
  }

  @override
  Future<bool> isCapturedPokemon(int index) async {
    return (await _capturedCache.get(index.toString()))?.isCaptured ?? false;
  }

  @override
  Future<List<int>> capturedPokemons() async {
    final entities = await _capturedCache.all;
    return entities.map((entity) => entity.index).toList();
  }
}
