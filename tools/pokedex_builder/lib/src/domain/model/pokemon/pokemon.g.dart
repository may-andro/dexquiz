// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      index: json['index'] as int,
      name: json['name'] as String,
      baseExperience: json['base_experience'] as int,
      weight: json['weight'] as int,
      height: json['height'] as int,
      imageUrl: json['image_url'] as String,
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
      moves: (json['moves'] as List<dynamic>).map((e) => e as String).toList(),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'weight': instance.weight,
      'height': instance.height,
      'image_url': instance.imageUrl,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'types': instance.types,
      'stats': instance.stats,
    };
