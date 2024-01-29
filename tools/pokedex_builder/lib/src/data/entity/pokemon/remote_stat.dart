import 'package:json_annotation/json_annotation.dart';

part 'remote_stat.g.dart';

@JsonSerializable()
class RemoteStat {
  RemoteStat(
    this.name,
    this.url,
  );

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory RemoteStat.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatToJson(this);
}
