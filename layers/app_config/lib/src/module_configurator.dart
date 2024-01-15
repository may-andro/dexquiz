import 'dart:async';

import 'package:app_config/src/data/data.dart';
import 'package:app_config/src/domain/domain.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/firebase.dart';

class AppConfigModuleConfigurator implements ModuleConfigurator {
  const AppConfigModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) {}

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    serviceLocator.registerFactory<AppConfigRepository>(
      () => RemoteAppConfigRepository(
        serviceLocator.get<GetDocumentUseCase>(),
        serviceLocator.get<BuildConfig>(),
      ),
    );

    serviceLocator.registerFactory<GetAppConfigUseCase>(
      () => GetAppConfigUseCase(
        serviceLocator.get<AppConfigRepository>(),
      ),
    );
  }
}
