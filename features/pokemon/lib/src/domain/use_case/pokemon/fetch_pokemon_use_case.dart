import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/repository/pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class FetchPokemonUseCase
    extends BaseAsyncUseCase<Pokemon, int, FetchPokemonFailure> {
  FetchPokemonUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  AsyncEither<FetchPokemonFailure, Pokemon> execute(int index) async {
    try {
      final pokemon = await _pokemonRepository.fetchPokemon(index);
      if (pokemon == null) {
        return Left(NullPokemonFailure());
      }
      return Right(pokemon);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownPokemonFailure(cause: error));
    }
  }
}

sealed class FetchPokemonFailure extends BasicFailure {
  const FetchPokemonFailure({super.message, super.cause});
}

final class NullPokemonFailure extends FetchPokemonFailure {
  const NullPokemonFailure({super.message, super.cause});
}

final class UnknownPokemonFailure extends FetchPokemonFailure {
  const UnknownPokemonFailure({super.message, super.cause});
}
