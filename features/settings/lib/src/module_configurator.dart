import 'dart:async';

import 'package:dependency_injector/dependency_injector.dart';

late ServiceLocator settingsServiceLocator;

class FeatureSettingsModuleConfigurator implements ModuleConfigurator {
  const FeatureSettingsModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) {}

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    settingsServiceLocator = serviceLocator;
  }
}
