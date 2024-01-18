import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SetUpError extends SplashState {
  final Object? cause;

  const SetUpError(this.cause);
}

final class SetUpProgress extends SplashState {
  const SetUpProgress(this.setUpStatus, this.progress);

  factory SetUpProgress.initial() => const SetUpProgress([], 0);

  final List<SetUpStatus> setUpStatus;
  final double progress;

  @override
  List<Object> get props => [setUpStatus, progress];
}

final class SetUpCompeted extends SplashState {
  const SetUpCompeted(this.designSystem);

  final DesignSystem designSystem;

  @override
  List<Object> get props => [designSystem];
}
