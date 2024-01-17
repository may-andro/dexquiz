import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';

sealed class SplashEvent {
  const SplashEvent();
}

final class OnStartEvent extends SplashEvent {}

final class OnErrorEvent extends SplashEvent {
  final Object? cause;

  OnErrorEvent(this.cause);
}

final class OnUpdateStatusEvent extends SplashEvent {
  final List<SetUpStatus> setUpStatus;

  OnUpdateStatusEvent(this.setUpStatus);
}

final class OnDesignSystemEvent extends SplashEvent {
  final DesignSystem designSystem;

  OnDesignSystemEvent(this.designSystem);
}
