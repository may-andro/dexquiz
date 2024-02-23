import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/remote/ability_entity.dart';
import 'package:pokemon/src/data/entity/remote/moves_entity.dart';
import 'package:pokemon/src/data/entity/remote/sprites_entity.dart';
import 'package:pokemon/src/data/entity/remote/stats_entity.dart';
import 'package:pokemon/src/data/entity/remote/types_entity.dart';

part 'pokemon_entity.g.dart';

@JsonSerializable()
class PokemonEntity {
  PokemonEntity(
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.abilities,
    this.moves,
    this.sprites,
    this.stats,
    this.types,
  );

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEntityToJson(this);

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'base_experience')
  int baseExperience;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'weight')
  int weight;

  @JsonKey(name: 'abilities')
  List<AbilityEntity> abilities;

  @JsonKey(name: 'moves')
  List<MovesEntity> moves;

  @JsonKey(name: 'sprites')
  SpritesEntity? sprites;

  @JsonKey(name: 'stats')
  List<StatsEntity> stats;

  @JsonKey(name: 'types')
  List<TypesEntity> types;
}
