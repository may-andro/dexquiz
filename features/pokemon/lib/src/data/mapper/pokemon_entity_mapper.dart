import 'package:pokemon/src/data/entity/remote/pokemon_entity.dart';
import 'package:pokemon/src/domain/model/pokemon.dart';

extension PokemonEntityMapper on PokemonEntity {
  Pokemon toPokemon() {
    final imageUrl = sprites?.other?.officialArtwork?.frontDefault ??
        sprites?.other?.dreamWorld?.frontDefault ??
        sprites?.frontDefault ??
        '';
    return Pokemon(
      id,
      name,
      baseExperience,
      height,
      weight,
      abilities.map((ability) => ability.ability.name).toList(),
      moves.map((move) => move.move.name).toList(),
      imageUrl,
      stats
          .map(
            (stat) => Stat(
              baseStat: stat.baseStat,
              effort: stat.effort,
              name: stat.stat.name,
            ),
          )
          .toList(),
      types.map((type) => type.type.name).toList(),
    );
  }
}
