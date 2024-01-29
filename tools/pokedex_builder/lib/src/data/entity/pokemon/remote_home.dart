import 'package:json_annotation/json_annotation.dart';

part 'remote_home.g.dart';

@JsonSerializable()
class RemoteHome {
  RemoteHome({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  factory RemoteHome.fromJson(Map<String, dynamic> json) =>
      _$RemoteHomeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteHomeToJson(this);
}
