import 'package:pokemon/src/domain/repository/pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class FetchDescriptionUseCase
    extends BaseAsyncUseCase<String, int, FetchDescriptionFailure> {
  FetchDescriptionUseCase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  AsyncEither<FetchDescriptionFailure, String> execute(int index) async {
    try {
      final description = await _pokemonRepository.fetchPokemonDescription(
        index,
      );
      if (description == null) {
        return Left(NullDescriptionFailure());
      }
      return Right(description);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownDescriptionFailure(cause: error));
    }
  }
}

sealed class FetchDescriptionFailure extends BasicFailure {
  const FetchDescriptionFailure({super.message, super.cause});
}

final class NullDescriptionFailure extends FetchDescriptionFailure {
  const NullDescriptionFailure({super.message, super.cause});
}

final class UnknownDescriptionFailure extends FetchDescriptionFailure {
  const UnknownDescriptionFailure({super.message, super.cause});
}
