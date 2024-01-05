import 'package:feature_flag/src/cache/feature_flag_cache.dart';
import 'package:feature_flag/src/cache/feature_flag_config.dart';
import 'package:mocktail/mocktail.dart';

class MockFeatureFlagCache extends Mock implements FeatureFlagCache {
  void mockAll(List<FeatureFlagConfig> expected) {
    when(() => all).thenAnswer((_) async => expected);
  }

  void mockAllException() {
    when(() => all).thenThrow(Exception());
  }

  void mockGet(FeatureFlagConfig? featureFlagConfig) {
    when(() => get(any())).thenAnswer((_) async => featureFlagConfig);
  }

  void mockGetException() {
    when(() => get(any())).thenThrow(Exception());
  }

  void mockPut() {
    when(() => put(any())).thenAnswer((_) async {});
  }

  void mockPutException() {
    when(() => put(any())).thenThrow(Exception());
  }

  void mockDeleteAll() {
    when(() => deleteAll()).thenAnswer((_) async {});
  }

  void mockPutAll() {
    when(() => putAll(any())).thenAnswer((_) async {});
  }

  void mockPutAllException() {
    when(() => putAll(any())).thenThrow(Exception());
  }
}
