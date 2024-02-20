class Pokemon {
  Pokemon(
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.weight,
    this.abilities,
    this.moves,
    this.image,
    this.stats,
    this.types, {
    this.isCaptured = false,
    this.isFavorite = false,
  });

  final int id;

  final String name;

  final int baseExperience;

  final int height;

  final int weight;

  final List<String> abilities;

  final List<String> moves;

  final String image;

  final List<Stat> stats;

  final List<String> types;

  final bool isCaptured;

  final bool isFavorite;

  Pokemon copyWith({
    bool? isCaptured,
    bool? isFavorite,
  }) {
    return Pokemon(
      id,
      name,
      baseExperience,
      height,
      weight,
      abilities,
      moves,
      image,
      stats,
      types,
      isCaptured: isCaptured ?? this.isCaptured,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class Stat {
  const Stat({
    required this.baseStat,
    required this.effort,
    required this.name,
  });

  final int baseStat;

  final int effort;

  final String name;
}
