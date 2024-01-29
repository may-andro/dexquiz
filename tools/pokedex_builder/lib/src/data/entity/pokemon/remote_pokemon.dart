import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_abilities.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_moves.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_sprites.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_stats.dart';
import 'package:pokedex_builder/src/data/entity/pokemon/remote_types.dart';

part 'remote_pokemon.g.dart';

@JsonSerializable()
class RemotePokemon {
  RemotePokemon(
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
  List<RemoteAbilities> abilities;

  @JsonKey(name: 'moves')
  List<RemoteMoves> moves;

  @JsonKey(name: 'sprites')
  RemoteSprites? sprites;

  @JsonKey(name: 'stats')
  List<RemoteStats> stats;

  @JsonKey(name: 'types')
  List<RemoteTypes> types;

  factory RemotePokemon.fromJson(Map<String, dynamic> json) =>
      _$RemotePokemonFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePokemonToJson(this);
}
