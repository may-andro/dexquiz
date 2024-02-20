import 'package:pokemon/src/domain/repository/captured_pokemon_repository.dart';
import 'package:use_case/use_case.dart';

class AddToCapturedUseCase extends BaseAsyncUseCase<void, int, UnknownFailure> {
  AddToCapturedUseCase(this._capturedPokemonRepository);

  final CapturedPokemonRepository _capturedPokemonRepository;

  @override
  AsyncEither<UnknownFailure, void> execute(
    int index,
  ) async {
    try {
      _capturedPokemonRepository.addToCaptured(index);
      return Right(null);
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure(cause: error));
    }
  }
}
