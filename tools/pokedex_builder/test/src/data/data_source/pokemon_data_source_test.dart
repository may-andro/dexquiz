import 'package:dio/dio.dart';
import 'package:pokedex_builder/src/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_pokemon.dart';
import 'package:pokedex_builder/src/data/service/remote_client_service.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';
import 'package:test/test.dart';

import '../../../mock/src/data/service/mock_remote_client_service.dart';

void main() {
  group(PokemonDataSourceImpl, () {
    late PokemonDataSource pokemonDataSource;

    late MockRemoteClientService mockRemoteClientService;

    setUp(() {
      mockRemoteClientService = MockRemoteClientService();

      pokemonDataSource = PokemonDataSourceImpl(mockRemoteClientService);
    });

    group('fetchPokemon', () {
      test('should return $RemotePokemon on successful execution', () async {
        final responseMap = <String, dynamic>{
          'id': 1,
          'name': 'bulbasaur',
          'base_experience': 64,
          'weight': 69,
          'height': 7,
          'abilities': [],
          'moves': [],
          'types': [],
          'stats': [],
          'sprites': null,
        };

        final response = Response<Map<String, dynamic>>(
          data: responseMap,
          requestOptions: RequestOptions(data: responseMap),
        );

        mockRemoteClientService.mockGetApiCall(response);

        final result = await pokemonDataSource.fetchPokemon(index: 1);

        expect(result.toJson(), responseMap);
      });

      test('should throw error when $RemoteClientService returns exception',
          () async {
        mockRemoteClientService.mockGetApiCallException(Exception());

        expect(
          () => pokemonDataSource.fetchPokemon(index: 1),
          throwsA(isA<Exception>()),
        );
      });

      test('should throw $ParsingException when response is invalid', () async {
        final responseMap = <String, dynamic>{
          'id': 1,
          'name': 'bulbasaur',
          'baseExperience': 64,
          'weight': 69,
          'height': 7,
          'abilities': [],
          'moves': [],
          'types': [],
          'stats': [],
          'sprites': null,
        };
        final response = Response<Map<String, dynamic>>(
          data: responseMap,
          requestOptions: RequestOptions(data: responseMap),
        );
        mockRemoteClientService.mockGetApiCall(response);

        expect(
          () => pokemonDataSource.fetchPokemon(index: 1),
          throwsA(isA<ParsingException>()),
        );
      });
    });
  });
}
