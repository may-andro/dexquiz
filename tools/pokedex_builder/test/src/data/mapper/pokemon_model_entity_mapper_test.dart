import 'package:pokedex_builder/src/data/entity/pokemon/remote_pokemon.dart';
import 'package:pokedex_builder/src/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group(PokemonModelEntityMapper, () {
    late PokemonModelEntityMapper pokemonModelEntityMapper;

    setUp(() {
      pokemonModelEntityMapper = PokemonModelEntityMapper();
    });

    group('mapFromEntityToModel', () {
      test('should map $RemotePokemon to $Pokemon', () {
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

        final pokemon = Pokemon(
          index: 1,
          name: 'bulbasaur',
          baseExperience: 64,
          weight: 69,
          height: 7,
          imageUrl: '',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
        );

        final result = pokemonModelEntityMapper.mapFromEntityToModel(
          remotePokemon,
        );

        expect(result.toJson(), pokemon.toJson());
      });
    });

    group('mapFromModelToEntity', () {
      test('should throw $ParsingException', () {
        final pokemon = Pokemon(
          index: 1,
          name: 'bulbasaur',
          baseExperience: 64,
          weight: 69,
          height: 7,
          imageUrl: '',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
        );

        expect(
          () => pokemonModelEntityMapper.mapFromModelToEntity(pokemon),
          throwsA(isA<ParsingException>()),
        );
      });
    });
  });
}
