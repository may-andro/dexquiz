import 'dart:async';

import 'package:dependency_injector/dependency_injector.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheModuleConfigurator implements ModuleConfigurator {
  const CacheModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {
    await Hive.initFlutter();
    serviceLocator.registerSingleton<HiveInterface>(() => Hive);

    final sharedPreferences = await SharedPreferences.getInstance();
    serviceLocator.registerSingleton<SharedPreferences>(
      () => sharedPreferences,
    );
  }

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {}
}
