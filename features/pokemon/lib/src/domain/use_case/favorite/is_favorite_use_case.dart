import 'package:pokemon/src/domain/repository/favourite_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class IsFavoriteUseCase extends BaseAsyncUseCase<bool, int, UnknownFailure> {
  IsFavoriteUseCase(this._favoritePokemonRepository);

  final FavoritePokemonRepository _favoritePokemonRepository;

  @override
  AsyncEither<UnknownFailure, bool> execute(int index) async {
    try {
      final isFavorite = await _favoritePokemonRepository.isFavoritePokemon(
        index,
      );
      return Right(isFavorite);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure());
    }
  }
}
