import 'package:dependency_injector/src/configurator/module_configurator.dart';
import 'package:dependency_injector/src/locator/service_locator.dart';
import 'package:dependency_injector/src/di_graph_service.dart';
import 'package:dependency_injector/src/model/setup_status.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockModuleConfigurator extends Mock implements ModuleConfigurator {}

class MockServiceLocator extends Mock implements ServiceLocator {}

void main() {
  group(DIGraphService, () {
    test('should emits the correct $SetUpStatus', () async {
      final mockServiceLocator = MockServiceLocator();
      final mockConfigurator1 = MockModuleConfigurator();
      final mockConfigurator2 = MockModuleConfigurator();
      final mockConfigurator3 = MockModuleConfigurator();

      final configurators = [
        mockConfigurator1,
        mockConfigurator2,
        mockConfigurator3
      ];

      when(() => mockConfigurator1.preDependenciesSetup(mockServiceLocator))
          .thenAnswer((_) async {});
      when(() => mockConfigurator2.preDependenciesSetup(mockServiceLocator))
          .thenAnswer((_) async {});
      when(() => mockConfigurator3.preDependenciesSetup(mockServiceLocator))
          .thenAnswer((_) async {});

      when(() => mockConfigurator1.registerDependencies(mockServiceLocator))
          .thenAnswer((_) async {});
      when(() => mockConfigurator2.registerDependencies(mockServiceLocator))
          .thenAnswer((_) async {});
      when(() => mockConfigurator3.registerDependencies(mockServiceLocator))
          .thenAnswer((_) async {});

      when(() => mockConfigurator1.postDependenciesSetup(mockServiceLocator))
          .thenAnswer((_) async {});
      when(() => mockConfigurator2.postDependenciesSetup(mockServiceLocator))
          .thenAnswer((_) async {});
      when(() => mockConfigurator3.postDependenciesSetup(mockServiceLocator))
          .thenAnswer((_) async {});

      final diGraphService = DIGraphService();

      final stream = diGraphService.setUpDIGraph(
        configurators: configurators,
        serviceLocator: mockServiceLocator,
      );

      await expectLater(
        stream,
        emitsInOrder(
          [
            SetUpStatus.warmup,
            SetUpStatus.fetch,
            SetUpStatus.register,
            SetUpStatus.done,
          ],
        ),
      );
    });
  });
}
