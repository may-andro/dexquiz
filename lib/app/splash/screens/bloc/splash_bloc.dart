import 'dart:async';

import 'package:app_config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/bloc/splash_event.dart';
import 'package:dexquiz/app/splash/screens/bloc/splash_state.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._diGraphService,
    this._moduleConfigurators,
  ) : super(SetUpProgress.initial()) {
    on<StartSetUp>(_onStartEvent);
  }

  final DIGraphService _diGraphService;

  final List<ModuleConfigurator> _moduleConfigurators;

  final _receivedSetUpStatus = <SetUpStatus>[];

  FutureOr<void> _onStartEvent(
    StartSetUp event,
    Emitter<SplashState> emit,
  ) async {
    await emit.onEach<SetUpStatus>(
      _diGraphService.setUpDIGraph(configurators: _moduleConfigurators),
      onData: (setUpStatus) {
        _receivedSetUpStatus.add(setUpStatus);
        final progress =
            _receivedSetUpStatus.length / SetUpStatus.values.length;
        emit(SetUpProgress(_receivedSetUpStatus, progress));
      },
      onError: (error, stackTrace) {
        emit(SetUpError(error));
      },
    );

    final getAppConfigUseCase = appServiceLocator.get<GetAppConfigUseCase>();
    final appConfig = await getAppConfigUseCase();
    appConfig.fold(
      (left) => emit(SetUpError(left.cause)),
      (right) {
        final designSystem = DesignSystem.values.firstWhereOrNull(
              (designSystem) {
                return designSystem.name == appConfig.right.themeCode;
              },
            ) ??
            DesignSystem.grass;
        emit(SetUpCompeted(designSystem));
      },
    );
  }
}
