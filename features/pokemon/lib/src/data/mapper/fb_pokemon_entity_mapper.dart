import 'package:pokemon/src/data/entity/firebase/pokemon_entity.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';

extension FBPokemonEntityMapper on PokemonEntity {
  Pokemon toPokemon() {
    return Pokemon(
      index,
      name,
      baseExperience,
      height,
      weight,
      abilities,
      moves,
      imageUrl,
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
