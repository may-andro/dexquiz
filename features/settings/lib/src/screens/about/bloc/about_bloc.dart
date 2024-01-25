import 'dart:async';

import 'package:app_config/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/screens/about/bloc/about_event.dart';
import 'package:settings/src/screens/about/bloc/about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc(
    this._openUrlUseCase,
  ) : super(AboutState.initial()) {
    on<OpenUrl>(_openUrl);
  }

  final OpenUrlUseCase _openUrlUseCase;

  FutureOr<void> _openUrl(
    OpenUrl event,
    Emitter<AboutState> emit,
  ) async {
    final result = await _openUrlUseCase(
      'https://github.com/may-andro/dexquiz',
    );
    result.fold((left) {
      emit(state.copyWith(status: ScreenStatus.error, failure: left));
    }, (right) => null);
  }
}
