import 'package:pokemon/src/data/entity/local/pokemon_cache_entity.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';

extension PokemonCacheEntityMapper on PokemonCacheEntity {
  Pokemon toPokemon() {
    return Pokemon(
      id,
      name,
      baseExperience,
      height,
      weight,
      abilities,
      moves,
      image,
      stats
          .map(
            (stat) => Stat(
              baseStat: stat.baseStat,
              effort: stat.effort,
              name: stat.name,
            ),
          )
          .toList(),
      types,
    );
  }
}
