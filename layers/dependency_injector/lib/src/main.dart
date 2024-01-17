import 'package:dependency_injector/src/locator/get_it_service_locator.dart';
import 'package:dependency_injector/src/configurator/module_configurator.dart';
import 'package:dependency_injector/src/locator/service_locator.dart';
import 'package:dependency_injector/src/model/setup_status.dart';

Stream<SetUpStatus> setUpDIGraph({
  required List<ModuleConfigurator> configurators,
  ServiceLocator? serviceLocator,
}) async* {
  final tempServiceLocator = serviceLocator ?? GetItServiceLocator();

  yield SetUpStatus.warmup;

  for (var configurator in configurators) {
    await configurator.preDependenciesSetup(tempServiceLocator);
  }

  yield SetUpStatus.fetch;

  for (var configurator in configurators) {
    await configurator.registerDependencies(tempServiceLocator);
  }

  yield SetUpStatus.register;

  for (var configurator in configurators) {
    await configurator.postDependenciesSetup(tempServiceLocator);
  }

  yield SetUpStatus.done;
}
