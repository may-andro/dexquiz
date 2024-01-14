import 'package:feature_flag/src/domain/model/feature.dart';
import 'package:feature_flag/src/domain/repository/feature_flag_repository.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

class MockFeatureFlagRepository extends mocktail.Mock
    implements FeatureFlagRepository {
  void mockInitFeatureFlags() {
    mocktail.when(() => initFeatureFlags()).thenAnswer((_) async => null);
  }

  void mockInitFeatureFlagsException() {
    mocktail.when(() => initFeatureFlags()).thenThrow(Exception());
  }

  void mockGetFeatureFlags(Map<Feature, bool> expected) {
    mocktail.when(() => getFeatureFlags()).thenAnswer((_) async => expected);
  }

  void mockGetFeatureFlagsException() {
    mocktail.when(() => getFeatureFlags()).thenThrow(Exception());
  }

  void mockGetFeatureFlagStatus(bool expected) {
    mocktail
        .when(() => getFeatureFlagStatus(mocktail.any()))
        .thenAnswer((_) async => expected);
  }

  void mockGetFeatureFlagStatusException() {
    mocktail
        .when(() => getFeatureFlagStatus(mocktail.any()))
        .thenThrow(Exception());
  }

  void mockEnableFeatureFlag() {
    mocktail.when(() => enableFeatureFlag(mocktail.any())).thenReturn(null);
  }

  void mockDisableFeatureFlag() {
    mocktail.when(() => disableFeatureFlag(mocktail.any())).thenReturn(null);
  }

  void mockReset() {
    mocktail.when(() => reset()).thenAnswer((_) async => null);
  }

  void mockResetException() {
    mocktail.when(() => reset()).thenThrow(Exception());
  }
}
