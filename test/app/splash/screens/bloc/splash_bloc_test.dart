import 'package:app_config/app_config.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/bloc/bloc.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:use_case/use_case.dart';

class MockServiceLocator extends Mock implements ServiceLocator {
  void mockGet<T extends Object>(T expected) {
    when(() => get<T>()).thenReturn(expected);
  }
}

class MockGetAppConfigUseCase extends Mock implements GetAppConfigUseCase {
  void mockCallRight(AppConfig expected) {
    when(() => call()).thenAnswer((_) async => Right(expected));
  }
}

class MockDIGraphService extends Mock implements DIGraphService {}

void main() {
  group(SplashBloc, () {
    late SplashBloc splashBloc;

    late MockGetAppConfigUseCase mockGetAppConfigUseCase;
    late MockDIGraphService mockDIGraphService;

    bool isServiceLocatorInitialized = false;
    const designSystem = DesignSystem.fire;
    final appConfig = AppConfig.empty();

    setUp(() {
      if (!isServiceLocatorInitialized) {
        appServiceLocator = MockServiceLocator();
        isServiceLocatorInitialized = true;
      }

      mockGetAppConfigUseCase = MockGetAppConfigUseCase();
      mockDIGraphService = MockDIGraphService();

      mockGetAppConfigUseCase.mockCallRight(appConfig);
      when(() => appServiceLocator.get<GetAppConfigUseCase>()).thenReturn(
        mockGetAppConfigUseCase,
      );

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
          (_) => Stream.fromIterable(SetUpStatus.values),
        );
        when(() => mockGetAppConfigUseCase()).thenAnswer(
          (invocation) async => const Left(
            UnknownAppConfigFailure(cause: 'test'),
          ),
        );
      },
      act: (bloc) => bloc.add(StartSetUp()),
      expect: () => <SplashState>[
        const SetUpProgress(SetUpStatus.values, 0.25),
        const SetUpProgress(SetUpStatus.values, 0.5),
        const SetUpProgress(SetUpStatus.values, 0.75),
        const SetUpProgress(SetUpStatus.values, 1.0),
        const SetUpError('test'),
      ],
    );
  });
}
