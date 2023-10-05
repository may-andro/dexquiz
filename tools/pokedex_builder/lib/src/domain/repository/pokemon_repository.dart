import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> getPokemon(int index);
}
