import 'dart:async';

import 'package:dependency_injector/dependency_injector.dart';

class DevMenuModuleConfigurator implements ModuleConfigurator {
  const DevMenuModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {}
}
