import 'package:pokemon/src/domain/repository/captured_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class FetchCapturedPokemonsUseCase
    extends BaseNoParamAsyncUseCase<List<int>, FetchCapturedPokemonsFailure> {
  FetchCapturedPokemonsUseCase(this._capturedPokemonRepository);

  final CapturedPokemonRepository _capturedPokemonRepository;

  @override
  AsyncEither<FetchCapturedPokemonsFailure, List<int>> execute() async {
    try {
      final pokemons = await _capturedPokemonRepository.capturedPokemons();
      if (pokemons.isEmpty) {
        return Left(
          NoCapturesFoundFailure(
            message: 'No pokemons found',
            cause: null,
          ),
        );
      }
      return Right(pokemons);
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownCaptureFetchFailure(
          message: 'Failed to fetch captured pokemons',
          cause: error,
        ),
      );
    }
  }
}

sealed class FetchCapturedPokemonsFailure extends BasicFailure {
  const FetchCapturedPokemonsFailure({super.message, super.cause});
}

final class NoCapturesFoundFailure extends FetchCapturedPokemonsFailure {
  const NoCapturesFoundFailure({super.message, super.cause});
}

final class UnknownCaptureFetchFailure extends FetchCapturedPokemonsFailure {
  const UnknownCaptureFetchFailure({super.message, super.cause});
}
