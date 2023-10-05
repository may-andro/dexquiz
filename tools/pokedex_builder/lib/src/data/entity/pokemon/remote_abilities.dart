import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_ability.dart';

part 'remote_abilities.g.dart';

@JsonSerializable()
class RemoteAbilities {
  RemoteAbilities(
    this.ability,
    this.isHidden,
    this.slot,
  );

  @JsonKey(name: 'ability')
  final RemoteAbility ability;

  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  @JsonKey(name: 'slot')
  final int slot;

  factory RemoteAbilities.fromJson(Map<String, dynamic> json) =>
      _$RemoteAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAbilitiesToJson(this);
}
