import 'package:dependency_injector/src/configurator/module_configurator.dart';
import 'package:dependency_injector/src/locator/service_locator.dart';
import 'package:dependency_injector/src/main.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockModuleConfigurator extends Mock implements ModuleConfigurator {}

class MockServiceLocator extends Mock implements ServiceLocator {}

void main() {
  group('setUpDIGraph', () {
    test('setUpDIGraph test', () async {
      final mockConfigurator1 = MockModuleConfigurator();
      final mockConfigurator2 = MockModuleConfigurator();
      final mockServiceLocator = MockServiceLocator();

      await setUpDIGraph(
        configurators: [mockConfigurator1, mockConfigurator2],
        serviceLocator: mockServiceLocator,
      );

      verify(
        () => mockConfigurator1.preDependenciesSetup(mockServiceLocator),
      ).called(1);
      verify(
        () => mockConfigurator1.registerDependencies(mockServiceLocator),
      ).called(1);
      verify(
        () => mockConfigurator1.postDependenciesSetup(mockServiceLocator),
      ).called(1);

      verify(
        () => mockConfigurator2.preDependenciesSetup(mockServiceLocator),
      ).called(1);
      verify(
        () => mockConfigurator2.registerDependencies(mockServiceLocator),
      ).called(1);
      verify(
        () => mockConfigurator2.postDependenciesSetup(mockServiceLocator),
      ).called(1);
    });
  });
}
