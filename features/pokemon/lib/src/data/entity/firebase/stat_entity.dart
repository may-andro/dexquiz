import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stat_entity.g.dart';

@JsonSerializable()
class StatEntity extends Equatable {
  const StatEntity(
    this.baseStat,
    this.effort,
    this.name,
    this.url,
  );

  factory StatEntity.fromJson(Map<String, dynamic> json) =>
      _$StatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StatEntityToJson(this);

  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'effort')
  final int effort;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  @override
  List<Object?> get props => [baseStat, effort, name, url];
}
