import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';

@JsonSerializable()
class HomeEntity {
  HomeEntity({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeEntityToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
}
