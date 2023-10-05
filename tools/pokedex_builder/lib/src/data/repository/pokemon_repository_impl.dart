import 'package:fimber/fimber.dart';
import 'package:pokedex_builder/src/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_builder/src/data/mapper/pokemon_model_entity_mapper.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/pokemon.dart';
import 'package:pokedex_builder/src/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(
    this._pokemonDataSource,
    this._pokemonModelEntityMapper,
  );

  final PokemonDataSource _pokemonDataSource;
  final PokemonModelEntityMapper _pokemonModelEntityMapper;

  @override
  Future<Pokemon> getPokemon(int index) async {
    final pokemonEntity = await _pokemonDataSource.fetchPokemon(index: index);
    Fimber.i('Fetched PokemonEntity: ${pokemonEntity.name}');
    return _pokemonModelEntityMapper.mapFromEntityToModel(pokemonEntity);
  }
}
