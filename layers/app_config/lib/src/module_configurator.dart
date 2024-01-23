import 'dart:async';

import 'package:app_config/src/data/data.dart';
import 'package:app_config/src/data/repository/app_in_review_repository_impl.dart';
import 'package:app_config/src/domain/domain.dart';
import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:app_config/src/domain/use_case/use_case.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:firebase/firebase.dart';
import 'package:in_app_review/in_app_review.dart';

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

    final InAppReview inAppReview = InAppReview.instance;
    serviceLocator.registerFactory<AppInReviewRepository>(
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
  }
}
