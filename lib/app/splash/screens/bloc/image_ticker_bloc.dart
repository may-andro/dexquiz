import 'dart:async';

import 'package:dexquiz/app/splash/screens/utils/image_time_ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageTickerBloc extends Bloc<StartTickerEvent, ImageTickerState> {
  ImageTickerBloc(
    this._imageTimeTicker,
  ) : super(ImageTickerState.initial()) {
    on<StartTickerEvent>(_onStartEvent);
  }

  final ImageTimeTicker _imageTimeTicker;

  FutureOr<void> _onStartEvent(
    StartTickerEvent event,
    Emitter<ImageTickerState> emit,
  ) async {
    await emit.onEach<String>(
      _imageTimeTicker.tick(),
      onData: (imagePath) => emit(ImageTickerState(imagePath)),
    );
  }
}

final class ImageTickerState extends Equatable {
  const ImageTickerState(this.imagePath);

  final String imagePath;

  factory ImageTickerState.initial() {
    return const ImageTickerState('assets/images/eevee_1.png');
  }

  @override
  List<Object> get props => [imagePath];
}

final class StartTickerEvent {
  const StartTickerEvent();
}
