import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_dreamworld.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_home.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_official_artwork.dart';

part 'remote_other.g.dart';

@JsonSerializable()
class RemoteOther {
  RemoteOther({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  @JsonKey(name: 'dream_world')
  final RemoteDreamWorld? dreamWorld;

  @JsonKey(name: 'home')
  final RemoteHome? home;

  @JsonKey(name: 'official-artwork')
  final RemoteOfficialArtwork? officialArtwork;

  factory RemoteOther.fromJson(Map<String, dynamic> json) =>
      _$RemoteOtherFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOtherToJson(this);
}
