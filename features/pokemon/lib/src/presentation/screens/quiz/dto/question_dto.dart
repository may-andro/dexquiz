import 'package:equatable/equatable.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';

class QuestionDTO extends Equatable {
  QuestionDTO(
    this.pokemon,
    this.choices,
  );

  final Pokemon pokemon;

  final List<ChoiceDTO> choices;

  @override
  List<Object?> get props => [
        pokemon,
        choices,
      ];
}
