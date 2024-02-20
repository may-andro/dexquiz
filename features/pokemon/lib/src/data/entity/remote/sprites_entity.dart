import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/other_entity.dart';

part 'sprites_entity.g.dart';

@JsonSerializable()
class SpritesEntity {
  SpritesEntity({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  factory SpritesEntity.fromJson(Map<String, dynamic> json) =>
      _$SpritesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesEntityToJson(this);

  @JsonKey(name: 'back_default')
  final String? backDefault;

  @JsonKey(name: 'back_female')
  final String? backFemale;

  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  @JsonKey(name: 'other')
  final OtherEntity? other;
}
