import 'package:mocktail/mocktail.dart';
import 'package:pokedex_builder/src/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_pokemon.dart';

class MockPokemonDataSource extends Mock implements PokemonDataSource {
  void mockFetchPokemon(RemotePokemon expected) {
    when(() => fetchPokemon(index: any(named: 'index')))
        .thenAnswer((_) async => expected);
  }

  void mockFetchPokemonException(Exception expected) {
    when(() => fetchPokemon(index: any(named: 'index'))).thenThrow(expected);
  }
}
