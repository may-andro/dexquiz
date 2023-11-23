import 'package:dependency_injector/src/locator/service_locator.dart';
import 'package:dependency_injector/src/configurator/module_configurator.dart';

Future<void> setUpDIGraph<T>({
  required List<ModuleConfigurator<T>> configurators,
  required T config,
  required ServiceLocator serviceLocator,
}) async {
  await Future.wait(
    configurators.map((configurator) {
      return Future.value(
        configurator.preDependenciesSetup(
          config,
          serviceLocator,
        ),
      );
    }),
  );

  await Future.wait(
    configurators.map((configurator) {
      return Future.value(
        configurator.registerDependencies(
          config,
          serviceLocator,
        ),
      );
    }),
  );

  await Future.wait(
    configurators.map((configurator) {
      return Future.value(
        configurator.postDependenciesSetup(
          config,
          serviceLocator,
        ),
      );
    }),
  );
}
