import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/utils/build_config_mapper.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockIsFeatureEnabledUseCase extends Mock
    implements IsFeatureEnabledUseCase {}

void main() {
  group(LaunchBloc, () {
    late LaunchBloc launchBloc;

    late MockIsFeatureEnabledUseCase mockIsFeatureEnabledUseCase;

    final buildConfig = BuildConfig(
      buildFlavor: BuildFlavor.kanto,
      buildEnvironment: BuildEnvironment.staging,
    );

    setUp(() {
      mockIsFeatureEnabledUseCase = MockIsFeatureEnabledUseCase();

      launchBloc = LaunchBloc(buildConfig, mockIsFeatureEnabledUseCase);
    });

    test('should emit $Loading with initial state on start', () async {
      expect(launchBloc.state, const Loading());
    });

    blocTest(
      'should emit List<$Success> when $OnStart event received',
      build: () => launchBloc,
      setUp: () {
        when(
          () => mockIsFeatureEnabledUseCase(Feature.isPokedexEnabled),
        ).thenAnswer((_) async => const Right(true));
        when(
          () => mockIsFeatureEnabledUseCase(Feature.isQuizEnabled),
        ).thenAnswer((_) async => const Right(true));
      },
      act: (bloc) => bloc.add(OnStart()),
      expect: () => <Success>[
        Success(
          isQuizEnabled: true,
          isPokedexEnabled: true,
          imagePokedex: buildConfig.imagePokedex,
          imageHeader: buildConfig.imageHeader,
          imageFab: buildConfig.imageFab,
          imageLaunch: buildConfig.imageLaunch,
        ),
      ],
    );
  });
}
