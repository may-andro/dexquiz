import 'package:equatable/equatable.dart';

sealed class LaunchState extends Equatable {
  const LaunchState();

  @override
  List<Object> get props => [];
}

final class Loading extends LaunchState {
  const Loading();
}

final class Success extends LaunchState {
  const Success({
    required this.isPokedexEnabled,
    required this.imageHeader,
    required this.imageLaunch,
    required this.imagePokedex,
    required this.imageFab,
  });

  final bool isPokedexEnabled;
  final String imageHeader;
  final String imageLaunch;
  final String imagePokedex;
  final String imageFab;

  @override
  List<Object> get props => [
        isPokedexEnabled,
        imageHeader,
        imageLaunch,
        imagePokedex,
        imageFab,
      ];
}
