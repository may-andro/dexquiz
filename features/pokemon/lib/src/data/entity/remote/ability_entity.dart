import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/url_entity.dart';

part 'ability_entity.g.dart';

@JsonSerializable()
class AbilityEntity {
  AbilityEntity(
      this.ability,
      this.isHidden,
      this.slot,
      );

  factory AbilityEntity.fromJson(Map<String, dynamic> json) =>
      _$AbilityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityEntityToJson(this);

  @JsonKey(name: 'ability')
  final UrlEntity ability;

  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  @JsonKey(name: 'slot')
  final int slot;
}