import 'package:equatable/equatable.dart';

class PokemonColor extends Equatable {
  PokemonColor(
    this.primary,
    this.secondary,
  );

  final String primary;

  final String secondary;

  @override
  List<Object?> get props => [primary, secondary];
}
