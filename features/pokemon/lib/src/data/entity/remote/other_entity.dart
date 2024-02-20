import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/dreamworld_entity.dart';
import 'package:pokemon/src/data/entity/remote/home_entity.dart';
import 'package:pokemon/src/data/entity/remote/official_artwork_entity.dart';

part 'other_entity.g.dart';

@JsonSerializable()
class OtherEntity {
  OtherEntity({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  factory OtherEntity.fromJson(Map<String, dynamic> json) =>
      _$OtherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OtherEntityToJson(this);

  @JsonKey(name: 'dream_world')
  final DreamWorldEntity? dreamWorld;

  @JsonKey(name: 'home')
  final HomeEntity? home;

  @JsonKey(name: 'official-artwork')
  final OfficialArtworkEntity? officialArtwork;
}
