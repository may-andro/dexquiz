import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/screens/pokemon/pokemon_view_model.dart';
import 'package:use_case/use_case.dart';

import '../../../mock/domain/model/test_pokemon.dart';
import '../../../mock/domain/use_case/favorite/mock_add_to_favorites_use_case.dart';
import '../../../mock/domain/use_case/favorite/mock_is_favorite_use_case.dart';
import '../../../mock/domain/use_case/favorite/mock_remove_favorites_use_case.dart';
import '../../../mock/domain/use_case/pokemon/mock_fetch_description_use_case.dart';

void main() {
  group(PokemonViewModel, () {
    late PokemonViewModel pokemonViewModel;

    late MockAddToFavoritesUseCase mockAddToFavoritesUseCase;
    late MockRemoveFavoritesUseCase mockRemoveFavoritesUseCase;
    late MockIsFavoriteUseCase mockIsFavoriteUseCase;
    late MockFetchDescriptionUseCase mockFetchDescriptionUseCase;

    setUp(() {
      mockAddToFavoritesUseCase = MockAddToFavoritesUseCase();
      mockRemoveFavoritesUseCase = MockRemoveFavoritesUseCase();
      mockIsFavoriteUseCase = MockIsFavoriteUseCase();
      mockFetchDescriptionUseCase = MockFetchDescriptionUseCase();

      pokemonViewModel = PokemonViewModel(
        mockAddToFavoritesUseCase,
        mockRemoveFavoritesUseCase,
        mockIsFavoriteUseCase,
        mockFetchDescriptionUseCase,
      );
    });

    group('onInit', () {
      test('should get favorite status and update the pokemon', () async {
        mockIsFavoriteUseCase.mockRight(true);
        mockFetchDescriptionUseCase.mockRight('description');

        await pokemonViewModel.onInit(testPokemon);

        final pokemon = pokemonViewModel.pokemon;
        expect(pokemon.isFavorite, true);
      });

      test(
          'should ignore favorite status in case of failure in $IsFavoriteUseCase',
          () async {
        mockIsFavoriteUseCase.mockLeft();
        mockFetchDescriptionUseCase.mockRight('description');

        await pokemonViewModel.onInit(testPokemon);

        final pokemon = pokemonViewModel.pokemon;
        expect(pokemon.isFavorite, false);
      });

      test(
          'should set description when $FetchDescriptionUseCase return valid value',
          () async {
        mockIsFavoriteUseCase.mockRight(true);
        mockFetchDescriptionUseCase.mockRight('description');

        await pokemonViewModel.onInit(testPokemon);

        expect(pokemonViewModel.description, isNotNull);
        expect(pokemonViewModel.description, 'description');
      });

      test(
          'should set error message when $FetchDescriptionUseCase return $NullDescriptionFailure',
          () async {
        mockIsFavoriteUseCase.mockRight(true);
        mockFetchDescriptionUseCase.mockLeft(NullDescriptionFailure());

        await pokemonViewModel.onInit(testPokemon);

        expect(pokemonViewModel.description, 'No description found!');
      });

      test(
          'should set error message when $FetchDescriptionUseCase return $UnknownDescriptionFailure',
          () async {
        mockIsFavoriteUseCase.mockRight(true);
        mockFetchDescriptionUseCase.mockLeft(UnknownDescriptionFailure());

        await pokemonViewModel.onInit(testPokemon);

        expect(pokemonViewModel.description,
            'Failed to fetch the description due to unknown error: null');
      });
    });

    group('updateFavouriteStatus', () {
      test(
          'should add to favorites when pokemon not favorite and $AddToFavoritesUseCase return $Right',
          () async {
        mockIsFavoriteUseCase.mockRight(false);
        mockFetchDescriptionUseCase.mockRight('description');
        mockAddToFavoritesUseCase.mockRight();
        mockRemoveFavoritesUseCase.mockRight();

        await pokemonViewModel.onInit(testPokemon);
        await pokemonViewModel.updateFavouriteStatus();

        expect(pokemonViewModel.pokemon.isFavorite, true);
      });

      test(
          'should update error message when pokemon not favorite and $AddToFavoritesUseCase return $Left',
          () async {
        mockIsFavoriteUseCase.mockRight(false);
        mockFetchDescriptionUseCase.mockRight('description');
        mockAddToFavoritesUseCase.mockLeft();
        mockRemoveFavoritesUseCase.mockRight();

        await pokemonViewModel.onInit(testPokemon);
        await pokemonViewModel.updateFavouriteStatus();

        expect(pokemonViewModel.pokemon.isFavorite, false);
        expect(pokemonViewModel.errorMessage, isNotNull);
      });

      test(
          'should remove from favorites when pokemon is favorite and $RemoveFavoritesUseCase return $Right',
          () async {
        mockIsFavoriteUseCase.mockRight(true);
        mockFetchDescriptionUseCase.mockRight('description');
        mockAddToFavoritesUseCase.mockRight();
        mockRemoveFavoritesUseCase.mockRight();

        await pokemonViewModel.onInit(testPokemon);
        await pokemonViewModel.updateFavouriteStatus();

        expect(pokemonViewModel.pokemon.isFavorite, false);
      });

      test(
          'should update error message when pokemon is favorite and $RemoveFavoritesUseCase return $Left',
          () async {
        mockIsFavoriteUseCase.mockRight(true);
        mockFetchDescriptionUseCase.mockRight('description');
        mockAddToFavoritesUseCase.mockRight();
        mockRemoveFavoritesUseCase.mockLeft();

        await pokemonViewModel.onInit(testPokemon);
        await pokemonViewModel.updateFavouriteStatus();

        expect(pokemonViewModel.pokemon.isFavorite, true);
        expect(pokemonViewModel.errorMessage, isNotNull);
      });
    });
  });
}
