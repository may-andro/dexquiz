import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_move.dart';

part 'remote_moves.g.dart';

@JsonSerializable()
class RemoteMoves {
  RemoteMoves(this.move);

  @JsonKey(name: 'move')
  final RemoteMove move;

  factory RemoteMoves.fromJson(Map<String, dynamic> json) =>
      _$RemoteMovesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMovesToJson(this);
}
