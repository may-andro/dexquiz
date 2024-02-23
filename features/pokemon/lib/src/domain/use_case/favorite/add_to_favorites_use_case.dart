import 'package:pokemon/src/domain/repository/favourite_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class AddToFavoritesUseCase
    extends BaseAsyncUseCase<void, int, UnknownFailure> {
  AddToFavoritesUseCase(this._favoritePokemonRepository);

  final FavoritePokemonRepository _favoritePokemonRepository;

  @override
  AsyncEither<UnknownFailure, void> execute(int index) async {
    try {
      _favoritePokemonRepository.addToFavorites(index);
      return Right(null);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure());
    }
  }
}
