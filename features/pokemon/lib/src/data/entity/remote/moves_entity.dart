import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/url_entity.dart';

part 'moves_entity.g.dart';

@JsonSerializable()
class MovesEntity {
  MovesEntity(this.move);

  factory MovesEntity.fromJson(Map<String, dynamic> json) =>
      _$MovesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovesEntityToJson(this);

  @JsonKey(name: 'move')
  final UrlEntity move;
}
