import 'package:mocktail/mocktail.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:pokedex_builder/src/domain/repository/pokemon_repository.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {
  void mockGetPokemon(Pokemon expected) {
    when(() => getPokemon(any())).thenAnswer((_) async => expected);
  }

  void mockGetPokemonThrowException(Object expected) {
    when(() => getPokemon(any())).thenThrow(expected);
  }
}
