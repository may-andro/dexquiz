import 'dart:async';

import 'package:app_config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/bloc/splash_event.dart';
import 'package:dexquiz/app/splash/screens/bloc/splash_state.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._buildConfig,
    this._moduleConfigurators,
  ) : super(SplashState.initial()) {
    _setUpDependencies();
    on<OnStartEvent>(_onStartEvent);
    on<OnUpdateStatusEvent>(_onUpdateStatusEvent);
    on<OnDesignSystemEvent>(_onDesignSystemEvent);
    on<OnErrorEvent>(_onErrorEvent);
  }

  final BuildConfig _buildConfig;

  final List<ModuleConfigurator> _moduleConfigurators;

  late List<String> _imagePaths;

  int _imagePathsIndex = 0;

  final _receivedSetUpStatus = <SetUpStatus>[];

  FutureOr<void> _setUpDependencies() {
    setUpDIGraph(configurators: _moduleConfigurators).distinct().listen(
      (status) {
        _receivedSetUpStatus.add(status);
        add(OnUpdateStatusEvent(_receivedSetUpStatus));
      },
    ).onDone(_setUpDesignSystem);
  }

  Future<void> _setUpDesignSystem() async {
    final appConfig = await appServiceLocator.get<GetAppConfigUseCase>().call();
    appConfig.fold(
      (left) => add(OnErrorEvent(left.cause)),
      (right) {
        final designSystem = DesignSystem.values.firstWhereOrNull(
              (designSystem) {
                return designSystem.name == appConfig.right.themeCode;
              },
            ) ??
            DesignSystem.grass;
        add(OnDesignSystemEvent(designSystem));
      },
    );
  }

  FutureOr<void> _onStartEvent(
    OnStartEvent event,
    Emitter<SplashState> emit,
  ) async {
    _imagePaths = _buildConfig.buildFlavor.images;
    await emit.onEach(
      Stream.periodic(
        const Duration(milliseconds: 300),
        (_) {
          if (_imagePathsIndex + 1 == _imagePaths.length) {
            _imagePathsIndex = 0;
          } else {
            _imagePathsIndex = _imagePathsIndex + 1;
          }
          return _imagePaths[_imagePathsIndex];
        },
      ),
      onData: (imagePath) => emit(state.copyWith(imagePath: imagePath)),
    );
  }

  FutureOr<void> _onUpdateStatusEvent(
    OnUpdateStatusEvent event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(setUpStatus: event.setUpStatus));
  }

  FutureOr<void> _onDesignSystemEvent(
    OnDesignSystemEvent event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(designSystem: event.designSystem));
  }

  FutureOr<void> _onErrorEvent(
    OnErrorEvent event,
    Emitter<SplashState> emit,
  ) {
    emit(state.copyWith(error: event.cause));
  }
}

extension _BuildFlavorMapper on BuildFlavor {
  List<String> get images {
    switch (this) {
      case BuildFlavor.kanto:
        return [
          'assets/images/eevee_1.png',
          'assets/images/eevee_2.png',
          'assets/images/eevee_3.png',
          'assets/images/eevee_4.png',
        ];
      case BuildFlavor.johto:
        return [
          'assets/images/eevee_1.png',
          'assets/images/eevee_5.png',
          'assets/images/eevee_6.png',
        ];
    }
  }
}
