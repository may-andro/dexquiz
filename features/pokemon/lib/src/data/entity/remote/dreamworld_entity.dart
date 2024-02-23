import 'package:json_annotation/json_annotation.dart';

part 'dreamworld_entity.g.dart';

@JsonSerializable()
class DreamWorldEntity {
  DreamWorldEntity({
    this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorldEntity.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldEntityToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;
}
