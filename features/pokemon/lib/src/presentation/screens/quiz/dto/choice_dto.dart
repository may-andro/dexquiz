import 'package:equatable/equatable.dart';

class ChoiceDTO extends Equatable{
  ChoiceDTO(this.index, this.char);

  final int index;
  final String char;

  @override
  List<Object?> get props => [index, char];
}
