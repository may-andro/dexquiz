import 'dart:async';

import 'package:core/core.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/utils/build_config_mapper.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc(
    this._buildConfig,
    this._isFeatureEnabledUseCase,
  ) : super(const Loading()) {
    on<OnStart>(_onStartEvent);
  }

  final BuildConfig _buildConfig;
  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;

  FutureOr<void> _onStartEvent(
    OnStart event,
    Emitter<LaunchState> emit,
  ) async {
    final isAppReviewEnabled =
        await _isFeatureEnabledUseCase.call(Feature.inAppReview);

    bool isPokedexEnabled = false;

    isAppReviewEnabled.fold(
      (left) => isPokedexEnabled = false,
      (right) => isPokedexEnabled = right,
    );
    emit(
      Success(
        isPokedexEnabled: isPokedexEnabled,
        imageHeader: _buildConfig.imageHeader,
        imageLaunch: _buildConfig.imageLaunch,
        imagePokedex: _buildConfig.imagePokedex,
        imageFab: _buildConfig.imageFab,
      ),
    );
  }
}
