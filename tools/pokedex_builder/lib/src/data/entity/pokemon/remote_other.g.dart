// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOther _$RemoteOtherFromJson(Map<String, dynamic> json) => RemoteOther(
      dreamWorld: json['dream_world'] == null
          ? null
          : RemoteDreamWorld.fromJson(
              json['dream_world'] as Map<String, dynamic>),
      home: json['home'] == null
          ? null
          : RemoteHome.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: json['official-artwork'] == null
          ? null
          : RemoteOfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteOtherToJson(RemoteOther instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld,
      'home': instance.home,
      'official-artwork': instance.officialArtwork,
    };
