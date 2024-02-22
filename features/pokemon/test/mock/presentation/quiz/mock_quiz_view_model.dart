import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/answer_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/question_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';

class MockQuizViewModel extends Mock implements QuizViewModel {
  void mockViewState(ViewState expected) {
    when(() => viewState).thenReturn(expected);
  }

  void mockOnInit() {
    when(() => onInit()).thenAnswer((_) async => null);
  }

  void mockLoadPokemon() {
    when(() => loadPokemon()).thenAnswer((_) async => null);
  }

  void mockSubmitChoice() {
    when(() => submitChoice(any(), any())).thenAnswer((_) async => null);
  }

  void mockAnswerDTO(AnswerDTO? expected) {
    when(() => answerDTO).thenReturn(expected);
  }

  void mockErrorMessage(String? expected) {
    when(() => errorMessage).thenReturn(expected);
  }

  void mockQuestionDTO(QuestionDTO? expected) {
    when(() => questionDTO).thenReturn(expected);
  }
}
