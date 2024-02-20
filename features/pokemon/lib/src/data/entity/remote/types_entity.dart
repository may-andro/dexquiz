import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/url_entity.dart';

part 'types_entity.g.dart';

@JsonSerializable()
class TypesEntity {
  TypesEntity(this.type);

  factory TypesEntity.fromJson(Map<String, dynamic> json) =>
      _$TypesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TypesEntityToJson(this);

  @JsonKey(name: 'type')
  final UrlEntity type;
}
