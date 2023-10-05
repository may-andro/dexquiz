import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_stat.dart';

part 'remote_stats.g.dart';

@JsonSerializable()
class RemoteStats {
  RemoteStats(
    this.baseStat,
    this.effort,
    this.stat,
  );

  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'effort')
  final int effort;

  @JsonKey(name: 'stat')
  final RemoteStat stat;

  factory RemoteStats.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatsToJson(this);
}
