import 'package:json_annotation/json_annotation.dart';

part 'remote_type.g.dart';

@JsonSerializable()
class RemoteType {
  RemoteType(
    this.name,
    this.url,
  );

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory RemoteType.fromJson(Map<String, dynamic> json) =>
      _$RemoteTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteTypeToJson(this);
}
