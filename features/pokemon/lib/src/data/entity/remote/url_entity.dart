import 'package:json_annotation/json_annotation.dart';

part 'url_entity.g.dart';

@JsonSerializable()
class UrlEntity {
  UrlEntity(
    this.name,
    this.url,
  );

  factory UrlEntity.fromJson(Map<String, dynamic> json) =>
      _$UrlEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UrlEntityToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;
}
