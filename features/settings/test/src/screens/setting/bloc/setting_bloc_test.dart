import 'package:app_config/app_config.dart';
import 'package:core/core.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settings/src/screens/setting/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:settings/src/screens/setting/dto/setting_dto.dart';
import 'package:use_case/use_case.dart';
import 'package:bloc_test/bloc_test.dart';

class MockIsFeatureEnabledUseCase extends Mock
    implements IsFeatureEnabledUseCase {
  void mockCallRight(bool expected) {
    when(() => call(any())).thenAnswer(
      (invocation) async => Right(expected),
    );
  }

  void mockCallLeft() {
    when(() => call(any())).thenAnswer(
      (invocation) async => Left(UnknownFailure()),
    );
  }
}

class MockGetAppInfoUseCase extends Mock implements GetAppInfoUseCase {
  void mockCallRight(AppInfo expected) {
    when(() => call()).thenAnswer(
      (invocation) async => Right(expected),
    );
  }

  void mockCallLeft() {
    when(() => call()).thenAnswer(
      (invocation) async => Left(UnknownFailure()),
    );
  }
}

class MockOpenUrlUseCase extends Mock implements OpenUrlUseCase {
  void mockCallRight() {
    when(() => call(any())).thenAnswer(
      (invocation) async => Right(null),
    );
  }

  void mockCallLeft(OpenUrlFailure failure) {
    when(() => call(any())).thenAnswer(
      (invocation) async => Left(failure),
    );
  }
}

void main() {
  group(SettingBloc, () {
    late SettingBloc settingBloc;

    late MockIsFeatureEnabledUseCase mockIsFeatureEnabledUseCase;
    late MockGetAppInfoUseCase mockGetAppInfoUseCase;
    late MockOpenUrlUseCase mockOpenUrlUseCase;
    late BuildConfig buildConfig;
    late AppConfig appConfig;

    setUpAll(() {
      registerFallbackValue(Feature.inAppReview);
    });

    setUp(() {
      mockIsFeatureEnabledUseCase = MockIsFeatureEnabledUseCase();
      mockGetAppInfoUseCase = MockGetAppInfoUseCase();
      mockOpenUrlUseCase = MockOpenUrlUseCase();
      buildConfig = BuildConfig(
        buildEnvironment: BuildEnvironment.staging,
        buildFlavor: BuildFlavor.kanto,
      );
      appConfig = AppConfig.empty();

      settingBloc = SettingBloc(
        buildConfig,
        appConfig,
        mockIsFeatureEnabledUseCase,
        mockGetAppInfoUseCase,
        mockOpenUrlUseCase,
      );
    });

    blocTest(
      'should emit $SettingState when $OnStart event received',
      build: () => settingBloc,
      setUp: () {
        mockIsFeatureEnabledUseCase.mockCallRight(true);
        mockGetAppInfoUseCase.mockCallRight(
          AppInfo(
            appName: 'appName',
            packageName: 'packageName',
            version: 'version',
            buildNumber: 'buildNumber',
          ),
        );
      },
      act: (bloc) => bloc.add(OnStart()),
      expect: () => <SettingState>[
        SettingState.initial().copyWith(
          status: SettingStatus.loading,
          failure: null,
          settingsDTO: null,
        ),
        SettingState.initial().copyWith(
          status: SettingStatus.loaded,
          failure: null,
          settingsDTO: SettingsDTO(true, true, 'version'),
        ),
      ],
    );

    blocTest(
      'should emit $SettingState with $Failure when $OpenPrivacyPolicyUrl event received',
      build: () => settingBloc,
      setUp: () {
        mockOpenUrlUseCase.mockCallLeft(InvalidUrlFailure());
      },
      act: (bloc) => bloc.add(OpenPrivacyPolicyUrl()),
      expect: () => <SettingState>[
        SettingState.initial().copyWith(
          status: SettingStatus.error,
          failure: InvalidUrlFailure(),
          settingsDTO: null,
        ),
      ],
    );
  });
}
