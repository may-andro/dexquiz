import 'package:pokedex_builder/src/data/entity/pokemon/remote_pokemon.dart';
import 'package:pokedex_builder/src/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/src/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:test/test.dart';

import '../../../mock/src/data/data_source/mock_pokemon_data_source.dart';

void main() {
  group(PokemonRepositoryImpl, () {
    late PokemonRepositoryImpl pokemonRepositoryImpl;

    late MockPokemonDataSource mockPokemonDataSource;

    late PokemonModelEntityMapper pokemonModelEntityMapper;

    setUp(() {
      mockPokemonDataSource = MockPokemonDataSource();
      pokemonModelEntityMapper = PokemonModelEntityMapper();

      pokemonRepositoryImpl = PokemonRepositoryImpl(
        mockPokemonDataSource,
        pokemonModelEntityMapper,
      );
    });

    group('getPokemon', () {
      test('should return $Pokemon', () async {
        final remotePokemon = RemotePokemon(
          1,
          'bulbasaur',
          64,
          7,
          69,
          [],
          [],
          null,
          [],
          [],
        );

        mockPokemonDataSource.mockFetchPokemon(remotePokemon);

        final result = await pokemonRepositoryImpl.getPokemon(1);

        expect(
          result.toJson(),
          pokemonModelEntityMapper.mapFromEntityToModel(remotePokemon).toJson(),
        );
      });
    });
  });
}
