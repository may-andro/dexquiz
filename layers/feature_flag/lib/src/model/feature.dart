enum Feature {
  inAppReview(key: 'in_app_review');

  const Feature({required this.key});

  final String key;

  factory Feature.getFeature(String key) {
    return Feature.values.firstWhere((feature) => feature.key == key);
  }
}
