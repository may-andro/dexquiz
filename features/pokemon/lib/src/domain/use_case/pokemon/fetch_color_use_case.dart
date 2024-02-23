import 'package:pokemon/src/domain/model/pokemon_color.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class FetchColorUseCase
    extends BaseAsyncUseCase<PokemonColor, int, FetchColorFailure> {
  FetchColorUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  AsyncEither<FetchColorFailure, PokemonColor> execute(int index) async {
    try {
      final color = await _pokemonRepository.fetchPokemonColor(
        index,
      );
      if (color == null) {
        return Left(NullColorFailure());
      }
      return Right(color);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownColorFailure(cause: error));
    }
  }
}

sealed class FetchColorFailure extends BasicFailure {
  const FetchColorFailure({super.message, super.cause});
}

final class NullColorFailure extends FetchColorFailure {
  const NullColorFailure({super.message, super.cause});
}

final class UnknownColorFailure extends FetchColorFailure {
  const UnknownColorFailure({super.message, super.cause});
}
