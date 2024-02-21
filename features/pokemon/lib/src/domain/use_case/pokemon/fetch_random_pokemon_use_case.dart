import 'dart:math';

import 'package:pokemon/src/domain/model/pokemon.dart';
import 'package:pokemon/src/domain/use_case/pokemon/fetch_pokemon_use_case.dart';
import 'package:use_case/use_case.dart';
import 'package:app_config/app_config.dart';

class FetchRandomPokemonUseCase
    extends BaseNoParamAsyncUseCase<Pokemon, UnknownFailure> {
  FetchRandomPokemonUseCase(
    this._appConfig,
    this._fetchPokemonUseCase,
  );

  final AppConfig _appConfig;
  final FetchPokemonUseCase _fetchPokemonUseCase;

  @override
  AsyncEither<UnknownFailure, Pokemon> execute() async {
    try {
      final index = _randomIndex;
      final either = await _fetchPokemonUseCase(index);
      return either.fold((left) {
        if (left is NullPokemonFailure) {
          return Left(
            UnknownFailure(
              message: 'No pokemon found due to null response',
            ),
          );
        } else {
          return Left(
            UnknownFailure(
              message:
                  'Failed to fetch pokemon due to unknown reason: ${left.cause}',
            ),
          );
        }
      }, (right) {
        return Right(right);
      });
    } catch (error, st) {
      reportError(error, st);
      return Left(UnknownFailure(
        message: 'Failed to fetch pokemon due to: $error',
        cause: error,
      ));
    }
  }

  int get _randomIndex {
    return _appConfig.pokedexStartEntry +
        Random().nextInt(
          _appConfig.pokedexEndEntry - _appConfig.pokedexStartEntry,
        );
  }
}
