import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_builder/src/domain/model/pokemon/stats.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon({
    required this.index,
    required this.name,
    required this.baseExperience,
    required this.weight,
    required this.height,
    required this.imageUrl,
    required this.abilities,
    required this.moves,
    required this.types,
    required this.stats,
  });

  @JsonKey(name: 'index')
  final int index;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'base_experience')
  final int baseExperience;

  @JsonKey(name: 'weight')
  final int weight;

  @JsonKey(name: 'height')
  final int height;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'abilities')
  final List<String> abilities;

  @JsonKey(name: 'moves')
  final List<String> moves;

  @JsonKey(name: 'types')
  final List<String> types;

  @JsonKey(name: 'stats')
  final List<Stats> stats;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  Map<String, dynamic> toFirestoreCollectionJson() {
    return {
      'mapValue': {
        'fields': {
          'index': {'integerValue': index.toString()},
          'name': {'stringValue': name},
          'base_experience': {'integerValue': baseExperience.toString()},
          'weight': {'integerValue': weight.toString()},
          'height': {'integerValue': height.toString()},
          'image_url': {'stringValue': imageUrl},
          'abilities': {
            'arrayValue': {
              'values':
                  abilities.map((ability) => {'stringValue': ability}).toList(),
            },
          },
          'moves': {
            'arrayValue': {
              'values': moves.map((move) => {'stringValue': move}).toList(),
            },
          },
          'types': {
            'arrayValue': {
              'values': types.map((type) => {'stringValue': type}).toList(),
            },
          },
          'stats': {
            'arrayValue': {
              'values': stats
                  .map((stat) => stat.toFirestoreCollectionJson())
                  .toList(),
            }
          },
        },
      },
    };
  }
}
