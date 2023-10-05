// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStats _$RemoteStatsFromJson(Map<String, dynamic> json) => RemoteStats(
      json['base_stat'] as int,
      json['effort'] as int,
      RemoteStat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteStatsToJson(RemoteStats instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };
