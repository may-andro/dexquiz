import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';

class PokemonFetchException implements Exception {}

class PokedexFetchException implements Exception {}

class PokemonDescFetchException implements Exception {}

abstract interface class PokemonRepository {
  Future<List<Pokemon>> fetchPokedex(String flavor);

  Future<Pokemon?> fetchPokemon(int index);

  Future<String?> fetchPokemonDescription(int index);

  Future<PokemonColor?> fetchPokemonColor(int index);
}
