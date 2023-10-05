import 'package:json_annotation/json_annotation.dart';

part 'remote_move.g.dart';

@JsonSerializable()
class RemoteMove {
  RemoteMove(
    this.name,
    this.url,
  );

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory RemoteMove.fromJson(Map<String, dynamic> json) =>
      _$RemoteMoveFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMoveToJson(this);
}
