import 'dart:async';

import 'package:core/core.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_config/app_config.dart';
import 'package:settings/src/screens/setting/bloc/setting_event.dart';
import 'package:settings/src/screens/setting/bloc/setting_state.dart';
import 'package:settings/src/screens/setting/dto/setting_dto.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(
    this._buildConfig,
    this._appConfig,
    this._isFeatureEnabledUseCase,
    this._getAppInfoUseCase,
    this._openUrlUseCase,
  ) : super(SettingState.initial()) {
    on<OnStart>(_onStartEvent);
    on<OpenPrivacyPolicyUrl>(_openPrivacyPolicyUrl);
  }

  final BuildConfig _buildConfig;

  final AppConfig _appConfig;

  final IsFeatureEnabledUseCase _isFeatureEnabledUseCase;

  final GetAppInfoUseCase _getAppInfoUseCase;

  final OpenUrlUseCase _openUrlUseCase;

  FutureOr<void> _onStartEvent(
    OnStart event,
    Emitter<SettingState> emit,
  ) async {
    emit(state.copyWith(status: SettingStatus.loading));
    final appReviewEither = await _isFeatureEnabledUseCase(Feature.inAppReview);
    final isAppReviewEnabled = appReviewEither.fold(
      (left) => false,
      (right) => right,
    );
    final appInfoEither = await _getAppInfoUseCase();
    final appInfo = appInfoEither.fold((left) => null, (right) => right);
    final isDevMenuEnabled = _buildConfig.buildEnvironment.isDevMenuEnabled;
    emit(
      state.copyWith(
        status: SettingStatus.loaded,
        settingsDTO: SettingsDTO(
          isAppReviewEnabled,
          isDevMenuEnabled,
          appInfo?.version ?? 'Not Found :(',
        ),
      ),
    );
  }

  FutureOr<void> _openPrivacyPolicyUrl(
    OpenPrivacyPolicyUrl event,
    Emitter<SettingState> emit,
  ) async {
    final result = await _openUrlUseCase(_appConfig.privacyPolicyUrl);
    result.fold((left) {
      emit(state.copyWith(status: SettingStatus.error, failure: left));
    }, (right) => null);
  }
}
