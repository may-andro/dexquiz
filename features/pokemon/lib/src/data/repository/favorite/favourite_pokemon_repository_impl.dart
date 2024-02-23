import 'package:pokemon/src/data/cache/favorite_cache.dart';
import 'package:pokemon/src/data/entity/local/favorite_cache_entity.dart';
import 'package:pokemon/src/domain/repository/favourite_pokemon_repository.dart';

class FavoritePokemonRepositoryImpl implements FavoritePokemonRepository {
  FavoritePokemonRepositoryImpl(this._favoritePokedexCache);

  final FavoriteCache _favoritePokedexCache;

  @override
  Future<void> addToFavorites(int index) {
    final cacheEntity = FavoriteCacheEntity(
      index: index,
      isFavorite: true,
    );
    return _favoritePokedexCache.put(cacheEntity);
  }

  @override
  Future<bool> isFavoritePokemon(int index) async {
    final cache = await _favoritePokedexCache.get(index.toString());
    return cache?.isFavorite ?? false;
  }

  @override
  Future<void> removeFromFavorites(int index) {
    return _favoritePokedexCache.delete(index.toString());
  }

  @override
  Future<List<int>> favoritePokemons() async {
    final entities = await _favoritePokedexCache.all;
    return entities.map((entity) => entity.index).toList();
  }
}
