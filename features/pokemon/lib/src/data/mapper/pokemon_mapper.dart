import 'package:pokemon/src/data/entity/local/pokemon_cache_entity.dart';
import 'package:pokemon/src/data/entity/local/stat_cache_entity.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';

extension PokemonMapper on Pokemon {
  PokemonCacheEntity toCacheEntity() {
    return PokemonCacheEntity(
      id: id,
      name: name,
      baseExperience: baseExperience,
      height: height,
      weight: weight,
      abilities: abilities,
      moves: moves,
      image: image,
      stats: stats
          .map(
            (stat) => StatCacheEntity(
              baseStat: stat.baseStat,
              effort: stat.effort,
              name: stat.name,
            ),
          )
          .toList(),
      types: types,
    );
  }
}
