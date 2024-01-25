import 'package:app_config/app_config.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/bloc/bloc.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockServiceLocator extends Mock implements ServiceLocator {
  void mockGet<T extends Object>(T expected) {
    when(() => get<T>()).thenReturn(expected);
  }
}

class MockDIGraphService extends Mock implements DIGraphService {}

void main() {
  group(SplashBloc, () {
    late SplashBloc splashBloc;

    late MockDIGraphService mockDIGraphService;

    bool isServiceLocatorInitialized = false;

    const designSystem = DesignSystem.fire;

    setUp(() {
      if (!isServiceLocatorInitialized) {
        appServiceLocator = MockServiceLocator();
        isServiceLocatorInitialized = true;
      }

      mockDIGraphService = MockDIGraphService();

      splashBloc = SplashBloc(mockDIGraphService, []);
    });

    test('should emit $SetUpProgress with initial state on start', () async {
      expect(splashBloc.state, SetUpProgress.initial());
    });

    blocTest(
      'should emit List<$SetUpStatus> when $StartSetUp event received',
      build: () => splashBloc,
      setUp: () {
        when(
          () => mockDIGraphService.setUpDIGraph(configurators: []),
        ).thenAnswer(
          (_) => Stream.fromIterable(SetUpStatus.values),
        );

        when(() => appServiceLocator.get<AppConfig>()).thenReturn(
          AppConfig(designSystem.name, '1', 1, 1, ''),
        );
      },
      act: (bloc) => bloc.add(StartSetUp()),
      expect: () => <SplashState>[
        const SetUpProgress(SetUpStatus.values, 0.25),
        const SetUpProgress(SetUpStatus.values, 0.5),
        const SetUpProgress(SetUpStatus.values, 0.75),
        const SetUpProgress(SetUpStatus.values, 1.0),
        const SetUpCompeted(designSystem),
      ],
    );

    blocTest(
      'should emit $SetUpError when there is error',
      build: () => splashBloc,
      setUp: () {
        when(
          () => mockDIGraphService.setUpDIGraph(configurators: []),
        ).thenAnswer(
          (_) => Stream.error(Exception()),
        );
      },
      act: (bloc) => bloc.add(StartSetUp()),
      expect: () => <SplashState>[
        const SetUpError(''),
      ],
    );
  });
}
