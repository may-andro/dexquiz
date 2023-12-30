import 'dart:async';

import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:dexquiz/demo/clear_grocery_cache.dart';
import 'package:dexquiz/demo/grocery.dart';
import 'package:dexquiz/demo/grocery_cache.dart';
import 'package:dexquiz/utils/log_use_case_interceptor.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:cache/cache.dart';

late final ServiceLocator appServiceLocator;

class AppModuleConfigurator implements ModuleConfigurator {
  AppModuleConfigurator(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) => null;

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    appServiceLocator = serviceLocator;
    serviceLocator.registerSingleton(() => _buildConfig);
    serviceLocator.registerFactory(
      () => LogUseCaseInterceptor(
        serviceLocator.get<LogReporter>(),
      ),
    );

    final hive = serviceLocator.get<HiveInterface>();
    hive.registerAdapter(GroceryAdapter());
    final groceryBox = await hive.openBox<Grocery>('grocery_box');
    serviceLocator.registerSingleton(() => GroceryCache(groceryBox));

    final clearGroceryCache = ClearGroceryCache(
      serviceLocator.get<SharedPreferences>(),
    );
    clearGroceryCache.put(true);
    serviceLocator.registerSingleton(() => clearGroceryCache);
  }
}
