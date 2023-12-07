import 'package:dependency_injector/src/configurator/module_configurator.dart';
import 'package:dependency_injector/src/locator/service_locator.dart';
import 'package:dependency_injector/src/main.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockModuleConfigurator<T> extends Mock implements ModuleConfigurator<T> {}

class MockServiceLocator extends Mock implements ServiceLocator {}

void main() {
  group('setUpDIGraph', () {
    test('setUpDIGraph test', () async {
      final mockConfigurator1 = MockModuleConfigurator<String>();
      final mockConfigurator2 = MockModuleConfigurator<String>();
      final mockServiceLocator = MockServiceLocator();
      final config = 'test_config';
      final configurators = [mockConfigurator1, mockConfigurator2];

      await setUpDIGraph(
        configurators: configurators,
        config: config,
        serviceLocator: mockServiceLocator,
      );

      verify(
        () => mockConfigurator1.preDependenciesSetup(
          config,
          mockServiceLocator,
        ),
      ).called(1);
      verify(
        () => mockConfigurator1.registerDependencies(
          config,
          mockServiceLocator,
        ),
      ).called(1);
      verify(
        () => mockConfigurator1.postDependenciesSetup(
          config,
          mockServiceLocator,
        ),
      ).called(1);

      verify(
        () => mockConfigurator2.preDependenciesSetup(
          config,
          mockServiceLocator,
        ),
      ).called(1);
      verify(
        () => mockConfigurator2.registerDependencies(
          config,
          mockServiceLocator,
        ),
      ).called(1);
      verify(
        () => mockConfigurator2.postDependenciesSetup(
          config,
          mockServiceLocator,
        ),
      ).called(1);
    });
  });
}
