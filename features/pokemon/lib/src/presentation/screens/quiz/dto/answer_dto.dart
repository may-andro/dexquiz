import 'package:equatable/equatable.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';

class AnswerDTO extends Equatable {
  AnswerDTO._({
    required this.answers,
    required this.status,
  });

  final Map<int, ChoiceDTO> answers;

  final CaptureStatus status;

  factory AnswerDTO.empty() {
    return AnswerDTO._(
      answers: {},
      status: CaptureStatus.guessing,
    );
  }

  AnswerDTO copyWith({
    Map<int, ChoiceDTO>? answers,
    CaptureStatus? status,
  }) {
    return AnswerDTO._(
      answers: answers ?? this.answers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        answers,
        status,
      ];
}
