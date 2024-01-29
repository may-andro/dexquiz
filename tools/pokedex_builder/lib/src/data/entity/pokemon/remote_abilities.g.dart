// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_abilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAbilities _$RemoteAbilitiesFromJson(Map<String, dynamic> json) =>
    RemoteAbilities(
      RemoteAbility.fromJson(json['ability'] as Map<String, dynamic>),
      json['is_hidden'] as bool,
      json['slot'] as int,
    );

Map<String, dynamic> _$RemoteAbilitiesToJson(RemoteAbilities instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
