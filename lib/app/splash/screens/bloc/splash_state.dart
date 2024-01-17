import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  const SplashState._({
    required this.imagePath,
    this.setUpStatus,
    this.error,
    this.designSystem,
  });

  final String imagePath;
  final List<SetUpStatus>? setUpStatus;
  final Object? error;
  final DesignSystem? designSystem;

  factory SplashState.initial() {
    return const SplashState._(
      imagePath: 'assets/images/eevee_1.png',
      setUpStatus: null,
      error: null,
      designSystem: null,
    );
  }

  SplashState copyWith({
    String? imagePath,
    List<SetUpStatus>? setUpStatus,
    Object? error,
    DesignSystem? designSystem,
  }) =>
      SplashState._(
        imagePath: imagePath ?? this.imagePath,
        setUpStatus: setUpStatus ?? this.setUpStatus,
        error: error ?? this.error,
        designSystem: designSystem ?? this.designSystem,
      );

  @override
  List<Object?> get props => [
        imagePath,
        setUpStatus,
        error,
        designSystem,
      ];
}
