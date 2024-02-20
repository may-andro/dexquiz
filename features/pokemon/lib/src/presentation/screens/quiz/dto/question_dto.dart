import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';

class QuestionDTO {
  QuestionDTO(
    this.pokemon,
    this.choices,
  );

  final Pokemon pokemon;

  final List<ChoiceDTO> choices;
}
