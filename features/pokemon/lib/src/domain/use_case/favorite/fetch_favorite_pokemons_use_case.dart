import 'package:pokemon/src/domain/repository/favourite_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class FetchFavoritePokemonsUseCase
    extends BaseNoParamAsyncUseCase<List<int>, FetchFavoritePokemonsFailure> {
  FetchFavoritePokemonsUseCase(this._favoritePokemonRepository);

  final FavoritePokemonRepository _favoritePokemonRepository;

  @override
  AsyncEither<FetchFavoritePokemonsFailure, List<int>> execute() async {
    try {
      final pokemons = await _favoritePokemonRepository.favoritePokemons();
      if (pokemons.isEmpty) {
        return Left(
          NoFavoritesFoundFailure(
            message: 'No pokemons found',
            cause: null,
          ),
        );
      }
      return Right(pokemons);
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownFavoritesFetchFailure(
          message: 'Failed to fetch favorite pokemons',
          cause: error,
        ),
      );
    }
  }
}

sealed class FetchFavoritePokemonsFailure extends BasicFailure {
  const FetchFavoritePokemonsFailure({super.message, super.cause});
}

final class NoFavoritesFoundFailure extends FetchFavoritePokemonsFailure {
  const NoFavoritesFoundFailure({super.message, super.cause});
}

final class UnknownFavoritesFetchFailure extends FetchFavoritePokemonsFailure {
  const UnknownFavoritesFetchFailure({super.message, super.cause});
}
