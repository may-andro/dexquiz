import 'package:dependency_injector/src/locator/get_it_service_locator.dart';
import 'package:dependency_injector/src/configurator/module_configurator.dart';
import 'package:dependency_injector/src/locator/service_locator.dart';

Future<void> setUpDIGraph({
  required List<ModuleConfigurator> configurators,
  ServiceLocator? serviceLocator,
}) async {
  final tempServiceLocator = serviceLocator ?? GetItServiceLocator();

  await Future.wait(
    configurators.map((configurator) {
      return Future.value(
        configurator.preDependenciesSetup(tempServiceLocator),
      );
    }),
  );

  for (var configurator in configurators) {
    await configurator.registerDependencies(tempServiceLocator);
  }

  await Future.wait(
    configurators.map((configurator) {
      return Future.value(
        configurator.postDependenciesSetup(tempServiceLocator),
      );
    }),
  );
}
