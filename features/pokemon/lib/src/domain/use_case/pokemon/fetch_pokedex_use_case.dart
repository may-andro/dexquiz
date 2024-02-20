import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';
import 'package:pokemon/src/domain/use_case/capture/fetch_captured_pokemons_use_case.dart';
import 'package:pokemon/src/domain/use_case/favorite/fetch_favorite_pokemons_use_case.dart';
import 'package:use_case/use_case.dart';

class FetchPokedexUseCase
    extends BaseAsyncUseCase<List<Pokemon>, String, UnknownFailure> {
  FetchPokedexUseCase(
    this._pokemonRepository,
    this._fetchFavoritePokemonsUseCase,
    this._fetchCapturedPokemonsUseCase,
  );

  final PokemonRepository _pokemonRepository;
  final FetchFavoritePokemonsUseCase _fetchFavoritePokemonsUseCase;
  final FetchCapturedPokemonsUseCase _fetchCapturedPokemonsUseCase;

  @override
  AsyncEither<UnknownFailure, List<Pokemon>> execute(String flavor) async {
    try {
      /// get all pokemons
      final pokemons = await _pokemonRepository.fetchPokedex(flavor);

      /// get all favorites
      final favorites = <int>[];
      final favoritesEither = await _fetchFavoritePokemonsUseCase();
      favoritesEither.fold((left) {
        reportError(left, StackTrace.current);
      }, (right) {
        favorites.addAll(right);
      });

      /// get all captured pokemons
      final captures = <int>[];
      final capturedEither = await _fetchCapturedPokemonsUseCase();
      capturedEither.fold((left) {
        reportError(left, StackTrace.current);
      }, (right) {
        captures.addAll(right);
      });

      return Right(
        pokemons.map((pokemon) {
          pokemon = pokemon.copyWith(
            isFavorite: favorites.contains(pokemon.id),
            isCaptured: captures.contains(pokemon.id),
          );
          return pokemon;
        }).toList(),
      );
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure(cause: error));
    }
  }
}
