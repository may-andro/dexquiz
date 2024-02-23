abstract interface class CapturedPokemonRepository {
  Future<void> addToCaptured(int index);

  Future<bool> isCapturedPokemon(int index);

  Future<List<int>> capturedPokemons();
}
