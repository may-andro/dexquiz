abstract interface class FavoritePokemonRepository {
  Future<void> addToFavorites(int index);

  Future<bool> isFavoritePokemon(int index);

  Future<void> removeFromFavorites(int index);

  Future<List<int>> favoritePokemons();
}
