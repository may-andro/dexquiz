import 'package:dartz/dartz.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:pokedex_builder/src/domain/use_case/pokemon/fetch_pokedex_use_case.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';
import 'package:test/test.dart';

import '../../../../mock/src/data/repository/mock_pokedex_repository.dart';
import '../../../../mock/src/data/repository/mock_pokemon_repository_impl.dart';

void main() {
  group(FetchPokedexUseCase, () {
    late MockPokedexRepository mockPokedexRepository;
    late MockPokemonRepository mockPokemonRepository;

    late FetchPokedexUseCase useCase;

    setUp(() {
      mockPokedexRepository = MockPokedexRepository();
      mockPokemonRepository = MockPokemonRepository();

      useCase = FetchPokedexUseCase(
        mockPokedexRepository,
        mockPokemonRepository,
      );
    });

    group('execute', () {
      test('should return $InvalidRangeFailure when endIndex < startIndex',
          () async {
        final int startIndex = 5;
        final int endIndex = 2;

        mockPokedexRepository.mockGetPokedexEndIndex(endIndex);
        mockPokedexRepository.mockGetPokedexStartIndex(startIndex);

        final result = await useCase.execute('kanto');

        expect(result, Left(InvalidRangeFailure(startIndex, endIndex)));
      });

      test('should return $UnknownRegionFailure on $UnknownRegionException',
          () async {
        mockPokedexRepository.mockGetPokedexStartIndex(1);
        mockPokedexRepository.mockGetPokedexEndIndex(5);
        mockPokemonRepository.mockGetPokemonThrowException(
          UnknownRegionException('region'),
        );

        final result = await useCase.execute('region');

        expect(result, Left(UnknownRegionFailure('region')));
      });

      test('should return $ParsingFailure on $ParsingException', () async {
        mockPokedexRepository.mockGetPokedexStartIndex(1);
        mockPokedexRepository.mockGetPokedexEndIndex(5);
        mockPokemonRepository.mockGetPokemonThrowException(
          ParsingException(''),
        );

        final result = await useCase.execute('region');

        expect(result, Left(ParsingFailure()));
      });

      test('should return ${List<Pokemon>} on success', () async {
        final pokemons = [
          Pokemon(
            index: 1,
            name: 'pokemon',
            baseExperience: 64,
            weight: 69,
            height: 7,
            imageUrl: '',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
          ),
          Pokemon(
            index: 1,
            name: 'pokemon',
            baseExperience: 64,
            weight: 69,
            height: 7,
            imageUrl: '',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
          ),
        ];

        mockPokedexRepository.mockGetPokedexStartIndex(1);
        mockPokedexRepository.mockGetPokedexEndIndex(2);
        mockPokemonRepository.mockGetPokemon(pokemons[0]);

        final result = await useCase.execute('region');

        expect(result.isRight(), true);
      });
    });
  });
}
