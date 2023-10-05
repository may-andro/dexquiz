import 'package:json_annotation/json_annotation.dart';

part 'remote_ability.g.dart';

@JsonSerializable()
class RemoteAbility {
  RemoteAbility(
    this.name,
    this.url,
  );

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory RemoteAbility.fromJson(Map<String, dynamic> json) =>
      _$RemoteAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAbilityToJson(this);
}
