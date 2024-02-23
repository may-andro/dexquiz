import 'package:json_annotation/json_annotation.dart';

part 'official_artwork_entity.g.dart';

@JsonSerializable()
class OfficialArtworkEntity {
  OfficialArtworkEntity({this.frontDefault});

  factory OfficialArtworkEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkEntityToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;
}
