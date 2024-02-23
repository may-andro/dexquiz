import 'package:pokemon/src/data/entity/firebase/color_entity.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';

extension ColorEntityMapper on ColorEntity {
  PokemonColor toPokemonColor() {
    return PokemonColor(primary, secondary);
  }
}
