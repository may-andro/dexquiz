// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePokemon _$RemotePokemonFromJson(Map<String, dynamic> json) =>
    RemotePokemon(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['base_experience'] as num).toInt(),
      (json['height'] as num).toInt(),
      (json['weight'] as num).toInt(),
      (json['abilities'] as List<dynamic>)
          .map((e) => RemoteAbilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['moves'] as List<dynamic>)
          .map((e) => RemoteMoves.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['sprites'] == null
          ? null
          : RemoteSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['stats'] as List<dynamic>)
          .map((e) => RemoteStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types'] as List<dynamic>)
          .map((e) => RemoteTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemotePokemonToJson(RemotePokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
    };
