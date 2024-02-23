import 'package:pokemon/src/domain/repository/favourite_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class RemoveFavoritesUseCase
    extends BaseAsyncUseCase<void, int, UnknownFailure> {
  RemoveFavoritesUseCase(this._favoritePokemonRepository);

  final FavoritePokemonRepository _favoritePokemonRepository;

  @override
  AsyncEither<UnknownFailure, void> execute(
    int index,
  ) async {
    try {
      _favoritePokemonRepository.removeFromFavorites(index);
      return Right(null);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure());
    }
  }
}
