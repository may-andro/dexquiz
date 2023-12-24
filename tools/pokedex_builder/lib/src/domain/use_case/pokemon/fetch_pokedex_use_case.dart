import 'package:pokedex_builder/src/domain/model/failure/failure.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:pokedex_builder/src/domain/repository/pokedex_repository.dart';
import 'package:pokedex_builder/src/domain/repository/pokemon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_builder/src/exception/exceptions.dart';

sealed class FetchPokedexFailure extends BasicFailure {
  const FetchPokedexFailure({super.message, super.cause});
}

class InvalidRangeFailure extends FetchPokedexFailure {
  InvalidRangeFailure(this.startValue, this.endValue);

  final int startValue;
  final int endValue;
}

class UnknownRegionFailure extends FetchPokedexFailure {
  UnknownRegionFailure(this.region);

  final String region;
}

class ParsingFailure extends FetchPokedexFailure {
  const ParsingFailure({super.cause});
}

class ServerFailure extends FetchPokedexFailure {
  ServerFailure(this.serverCode);

  final int? serverCode;
}

class UnknownFailure extends FetchPokedexFailure {
  const UnknownFailure(Object? cause) : super(cause: cause);
}

class FetchPokedexUseCase {
  FetchPokedexUseCase(
    this._pokedexRepository,
    this._pokemonRepository,
  );

  final PokedexRepository _pokedexRepository;
  final PokemonRepository _pokemonRepository;

  Future<Either<FetchPokedexFailure, List<Pokemon>>> execute(
    String region,
  ) async {
    final startIndex = _pokedexRepository.getPokedexStartIndex(region);
    final endIndex = _pokedexRepository.getPokedexEndIndex(region);
    if (endIndex < startIndex) {
      return Left(InvalidRangeFailure(startIndex, endIndex));
    }

    final pokedex = <Pokemon>[];
    var index = startIndex;
    while (index <= endIndex) {
      try {
        final pokemon = await _pokemonRepository.getPokemon(index);
        pokedex.add((pokemon));
        index++;
      } on UnknownRegionException catch (e) {
        return Left(UnknownRegionFailure(e.region));
      } on ParsingException catch (_) {
        return Left(ParsingFailure());
      } on ServerFailureException catch (e) {
        return Left(ServerFailure(e.responseStatusCode));
      } on UnknownServerFailureException catch (_) {
        return Left(ServerFailure(null));
      } catch (e) {
        return Left(UnknownFailure(e));
      }
    }
    return Right(pokedex);
  }
}
