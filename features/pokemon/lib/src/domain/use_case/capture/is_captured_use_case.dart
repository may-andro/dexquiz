import 'package:pokemon/src/domain/repository/captured_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class IsCapturedUseCase extends BaseAsyncUseCase<bool, int, UnknownFailure> {
  IsCapturedUseCase(this._capturedPokemonRepository);

  final CapturedPokemonRepository _capturedPokemonRepository;

  @override
  AsyncEither<UnknownFailure, bool> execute(int index) async {
    try {
      final isCaptured = await _capturedPokemonRepository.isCapturedPokemon(
        index,
      );
      return Right(isCaptured);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure());
    }
  }
}
