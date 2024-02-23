import 'package:pokemon/src/data/entity/local/color_cache_entity.dart';
import 'package:pokemon/src/domain/model/pokemon_color.dart';

extension ColorCacheEntityMapper on ColorCacheEntity {
  PokemonColor toPokemonColor() {
    return PokemonColor(primary, secondary);
  }
}
