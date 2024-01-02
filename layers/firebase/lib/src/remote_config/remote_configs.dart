enum RemoteConfigs {
  appTheme(key: 'app_theme', defaultValue: 'fire'),
  minimumAppVersion(key: 'minimum_app_version', defaultValue: '1.0.0'),
  inAppReview(key: 'in_app_review', defaultValue: false);

  const RemoteConfigs({
    required this.key,
    required this.defaultValue,
  });

  final String key;
  final dynamic defaultValue;

  static Map<String, dynamic> get defaultConfigsMap {
    final defaultConfigMap = <String, dynamic>{};
    values.map((value) {
      defaultConfigMap[value.key] = value.defaultValue;
    });
    return defaultConfigMap;
  }
}
