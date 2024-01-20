import 'package:equatable/equatable.dart';

sealed class LaunchEvent extends Equatable {
  const LaunchEvent();

  @override
  List<Object> get props => [];
}

final class OnStart extends LaunchEvent {}
