import 'dart:async';

import 'package:dependency_injector/src/locator/service_locator.dart';

abstract class ModuleConfigurator<T> {
  FutureOr<void> preDependenciesSetup(
    T config,
    ServiceLocator serviceLocator,
  );

  FutureOr<void> registerDependencies(
    T config,
    ServiceLocator serviceLocator,
  );

  FutureOr<void> postDependenciesSetup(
    T config,
    ServiceLocator serviceLocator,
  );
}
