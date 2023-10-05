import 'package:json_annotation/json_annotation.dart';

part 'remote_dreamworld.g.dart';

@JsonSerializable()
class RemoteDreamWorld {
  RemoteDreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  factory RemoteDreamWorld.fromJson(Map<String, dynamic> json) =>
      _$RemoteDreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDreamWorldToJson(this);
}
