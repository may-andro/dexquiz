import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/assets/assets.gen.dart' as pokemon_assets;

extension PokemonMapper on String {
  String get background {
    switch (this) {
      case 'bug':
        return pokemon_assets.Assets.images.pokemon.background.bug.path;
      case 'dark':
        return pokemon_assets.Assets.images.pokemon.background.dark.path;
      case 'dragon':
        return pokemon_assets.Assets.images.pokemon.background.dragon.path;
      case 'electric':
        return pokemon_assets.Assets.images.pokemon.background.electric.path;
      case 'fairy':
        return pokemon_assets.Assets.images.pokemon.background.fairy.path;
      case 'fighting':
        return pokemon_assets.Assets.images.pokemon.background.fighting.path;
      case 'fire':
        return pokemon_assets.Assets.images.pokemon.background.fire.path;
      case 'flying':
        return pokemon_assets.Assets.images.pokemon.background.flying.path;
      case 'ghost':
        return pokemon_assets.Assets.images.pokemon.background.ghost.path;
      case 'grass':
        return pokemon_assets.Assets.images.pokemon.background.grass.path;
      case 'ground':
        return pokemon_assets.Assets.images.pokemon.background.ground.path;
      case 'ice':
        return pokemon_assets.Assets.images.pokemon.background.ice.path;
      case 'normal':
        return pokemon_assets.Assets.images.pokemon.background.normal.path;
      case 'poison':
        return pokemon_assets.Assets.images.pokemon.background.poison.path;
      case 'psychic':
        return pokemon_assets.Assets.images.pokemon.background.psychic.path;
      case 'rock':
        return pokemon_assets.Assets.images.pokemon.background.rock.path;
      case 'steel':
        return pokemon_assets.Assets.images.pokemon.background.steel.path;
      case 'water':
        return pokemon_assets.Assets.images.pokemon.background.water.path;
      default:
        return pokemon_assets.Assets.images.pokemon.background.normal.path;
    }
  }

  DSColor getColor(BuildContext context) {
    switch (this) {
      case 'bug':
        return context.colorPalette.elemental.bug;
      case 'dark':
        return context.colorPalette.elemental.dark;
      case 'dragon':
        return context.colorPalette.elemental.dragon;
      case 'electric':
        return context.colorPalette.elemental.electric;
      case 'fairy':
        return context.colorPalette.elemental.fairy;
      case 'fighting':
        return context.colorPalette.elemental.fighting;
      case 'fire':
        return context.colorPalette.elemental.fire;
      case 'flying':
        return context.colorPalette.elemental.flying;
      case 'ghost':
        return context.colorPalette.elemental.ghost;
      case 'grass':
        return context.colorPalette.elemental.grass;
      case 'ground':
        return context.colorPalette.elemental.ground;
      case 'ice':
        return context.colorPalette.elemental.ice;
      case 'normal':
        return context.colorPalette.elemental.normal;
      case 'poison':
        return context.colorPalette.elemental.poison;
      case 'psychic':
        return context.colorPalette.elemental.psychic;
      case 'rock':
        return context.colorPalette.elemental.rock;
      case 'steel':
        return context.colorPalette.elemental.steel;
      case 'water':
        return context.colorPalette.elemental.water;
      default:
        return context.colorPalette.elemental.normal;
    }
  }

  String get image {
    switch (this) {
      case 'bug':
        return pokemon_assets.Assets.images.pokemon.type.bug.path;
      case 'dark':
        return pokemon_assets.Assets.images.pokemon.type.dark.path;
      case 'dragon':
        return pokemon_assets.Assets.images.pokemon.type.dragon.path;
      case 'electric':
        return pokemon_assets.Assets.images.pokemon.type.electric.path;
      case 'fairy':
        return pokemon_assets.Assets.images.pokemon.type.fairy.path;
      case 'fighting':
        return pokemon_assets.Assets.images.pokemon.type.fight.path;
      case 'fire':
        return pokemon_assets.Assets.images.pokemon.type.fire.path;
      case 'flying':
        return pokemon_assets.Assets.images.pokemon.type.flying.path;
      case 'ghost':
        return pokemon_assets.Assets.images.pokemon.type.ghost.path;
      case 'grass':
        return pokemon_assets.Assets.images.pokemon.type.grass.path;
      case 'ground':
        return pokemon_assets.Assets.images.pokemon.type.ground.path;
      case 'ice':
        return pokemon_assets.Assets.images.pokemon.type.ice.path;
      case 'normal':
        return pokemon_assets.Assets.images.pokemon.type.normal.path;
      case 'poison':
        return pokemon_assets.Assets.images.pokemon.type.poison.path;
      case 'psychic':
        return pokemon_assets.Assets.images.pokemon.type.psychic.path;
      case 'rock':
        return pokemon_assets.Assets.images.pokemon.type.rock.path;
      case 'steel':
        return pokemon_assets.Assets.images.pokemon.type.steel.path;
      case 'water':
        return pokemon_assets.Assets.images.pokemon.type.water.path;
      default:
        return pokemon_assets.Assets.images.pokemon.type.normal.path;
    }
  }
}
