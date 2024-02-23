enum Feature {
  inAppReview(key: 'in_app_review'),
  isQuizEnabled(key: 'is_quiz_enabled'),
  isPokedexEnabled(key: 'is_pokedex_enabled'),
  isPokemonDetailEnabled(key: 'is_pokemon_detail_enabled');

  const Feature({required this.key});

  final String key;

  factory Feature.getFeature(String key) {
    return Feature.values.firstWhere((feature) => feature.key == key);
  }
}
