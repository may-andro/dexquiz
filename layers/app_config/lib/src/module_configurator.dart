import 'dart:async';

import 'package:app_config/src/data/data.dart';
import 'package:app_config/src/domain/domain.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/firebase.dart';
import 'package:in_app_review/in_app_review.dart';

class AppConfigModuleConfigurator implements ModuleConfigurator {
  const AppConfigModuleConfigurator();

  @override
  FutureOr<void> postDependenciesSetup(ServiceLocator serviceLocator) async {
    final getAppConfigUseCase = serviceLocator.get<GetAppConfigUseCase>();
    final appConfig = await getAppConfigUseCase();
    appConfig.fold(
      (left) => throw PostRegisterDIException(left.message, left.cause),
      (right) => serviceLocator.registerSingleton<AppConfig>(() => right),
    );
  }

  @override
  FutureOr<void> preDependenciesSetup(ServiceLocator serviceLocator) async {}

  @override
  FutureOr<void> registerDependencies(ServiceLocator serviceLocator) async {
    serviceLocator.registerSingleton<AppConfigRepository>(
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

    final InAppReview inAppReview = InAppReview.instance;
    serviceLocator.registerSingleton<AppInReviewRepository>(
      () => AppInReviewRepositoryImpl(inAppReview),
    );

    serviceLocator.registerFactory<OpenStoreListingUseCase>(
      () => OpenStoreListingUseCase(
        serviceLocator.get<AppInReviewRepository>(),
      ),
    );

    serviceLocator.registerFactory<RequestReviewUseCase>(
      () => RequestReviewUseCase(
        serviceLocator.get<AppInReviewRepository>(),
      ),
    );

    serviceLocator.registerSingleton<ExternalAppLauncherRepository>(
      () => ExternalAppLauncherRepositoryImpl(),
    );

    serviceLocator.registerFactory<OpenEmailAppUseCase>(
      () => OpenEmailAppUseCase(
        serviceLocator.get<ExternalAppLauncherRepository>(),
      ),
    );

    serviceLocator.registerFactory<OpenUrlUseCase>(
      () => OpenUrlUseCase(
        serviceLocator.get<ExternalAppLauncherRepository>(),
      ),
    );

    serviceLocator.registerSingleton<PackageInfoRepository>(
      () => PackageInfoRepositoryImpl(),
    );

    serviceLocator.registerFactory<GetAppInfoUseCase>(
      () => GetAppInfoUseCase(
        serviceLocator.get<PackageInfoRepository>(),
      ),
    );
  }
}
