import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/data/entity/firebase/stat_entity.dart';

part 'pokemon_entity.g.dart';

@JsonSerializable()
class PokemonEntity {
  PokemonEntity(
    this.index,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.abilities,
    this.moves,
    this.imageUrl,
    this.stats,
    this.types,
  );

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEntityToJson(this);

  @JsonKey(name: 'index')
  int index;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'base_experience')
  int baseExperience;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'weight')
  int weight;

  @JsonKey(name: 'abilities')
  List<String> abilities;

  @JsonKey(name: 'moves')
  List<String> moves;

  @JsonKey(name: 'image_url')
  String imageUrl;

  @JsonKey(name: 'stats')
  List<StatEntity> stats;

  @JsonKey(name: 'types')
  List<String> types;
}
