import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/url_entity.dart';

part 'stats_entity.g.dart';

@JsonSerializable()
class StatsEntity {
  StatsEntity(
    this.baseStat,
    this.effort,
    this.stat,
  );

  factory StatsEntity.fromJson(Map<String, dynamic> json) =>
      _$StatsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StatsEntityToJson(this);

  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'effort')
  final int effort;

  @JsonKey(name: 'stat')
  final UrlEntity stat;
}
