import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_type.dart';

part 'remote_types.g.dart';

@JsonSerializable()
class RemoteTypes {
  RemoteTypes(this.type);

  @JsonKey(name: 'type')
  final RemoteType type;

  factory RemoteTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteTypesToJson(this);
}
