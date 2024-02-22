import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/answer_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:use_case/use_case.dart';

import '../../../mock/domain/model/test_pokemon.dart';
import '../../../mock/domain/use_case/capture/mock_add_to_captured_use_case.dart';
import '../../../mock/domain/use_case/pokemon/mock_fetch_random_pokemon_use_case.dart';
import '../../../mock/domain/use_case/pokemon/mock_generate_quiz_options_use_case.dart';

const _options = <int, String>{
  0: 'B',
  1: 'U',
  2: 'L',
  3: 'B',
  4: 'A',
  5: 'S',
  6: 'A',
  7: 'U',
  8: 'R',
  9: 'A',
  10: 'B',
  11: 'C',
  12: 'D',
  13: 'E',
};

void main() {
  group(QuizViewModel, () {
    late QuizViewModel quizViewModel;

    late MockFetchRandomPokemonUseCase mockFetchRandomPokemonUseCase;
    late MockGenerateQuizOptionUseCase mockGenerateQuizOptionUseCase;
    late MockAddToCapturedUseCase mockAddToCapturedUseCase;

    setUp(() {
      mockFetchRandomPokemonUseCase = MockFetchRandomPokemonUseCase();
      mockGenerateQuizOptionUseCase = MockGenerateQuizOptionUseCase();
      mockAddToCapturedUseCase = MockAddToCapturedUseCase();

      quizViewModel = QuizViewModel(
        mockFetchRandomPokemonUseCase,
        mockGenerateQuizOptionUseCase,
        mockAddToCapturedUseCase,
      );
    });

    group('loadPokemon', () {
      test('should set ${ViewState.success} and generate question options',
          () async {
        mockFetchRandomPokemonUseCase.mockRight(testPokemon);
        mockGenerateQuizOptionUseCase.mockRight(_options);

        await quizViewModel.loadPokemon();

        await pumpEventQueue();

        expect(quizViewModel.errorMessage, isNull);
        expect(quizViewModel.isStateError, isFalse);
        expect(quizViewModel.isStateSuccess, isTrue);
        expect(quizViewModel.questionDTO, isNotNull);
        expect(quizViewModel.answerDTO, AnswerDTO.empty());
      });

      test('should set ${ViewState.error} when failed to fetch pokemon',
          () async {
        mockFetchRandomPokemonUseCase.mockLeft(
          UnknownFetchRandomPokemonFailure(),
        );

        await quizViewModel.loadPokemon();

        await pumpEventQueue();

        expect(quizViewModel.errorMessage, isNotNull);
        expect(quizViewModel.isStateError, isTrue);
        expect(quizViewModel.isStateSuccess, isFalse);
        expect(quizViewModel.questionDTO, isNull);
        expect(quizViewModel.answerDTO, isNull);
      });

      test('should set ${ViewState.error} when failed to generate quiz options',
          () async {
        mockFetchRandomPokemonUseCase.mockRight(testPokemon);
        mockGenerateQuizOptionUseCase.mockLeft(InvalidNameFailure());

        await quizViewModel.loadPokemon();

        await pumpEventQueue();

        expect(quizViewModel.errorMessage, isNotNull);
        expect(quizViewModel.isStateError, isTrue);
        expect(quizViewModel.isStateSuccess, isFalse);
        expect(quizViewModel.questionDTO, isNull);
        expect(quizViewModel.answerDTO, isNull);
      });
    });

    group('submitChoice', () {
      setUp(() async {
        mockFetchRandomPokemonUseCase.mockRight(testPokemon);
        mockGenerateQuizOptionUseCase.mockRight(_options);
      });

      test('should save the answer in $AnswerDTO', () async {
        final index = 0;
        final value = _options[index] ?? '';
        final choiceDTO = ChoiceDTO(index, value);

        await quizViewModel.loadPokemon();
        await pumpEventQueue();
        await quizViewModel.submitChoice(index, choiceDTO);
        await pumpEventQueue();

        expect(quizViewModel.answerDTO?.answers[index], choiceDTO);
        expect(quizViewModel.answerDTO?.status, CaptureStatus.guessing);
      });

      test(
          'should not call $AddToCapturedUseCase when $AnswerDTO length is smaller than pokemon name',
          () async {
        mockAddToCapturedUseCase.mockRight();

        await quizViewModel.loadPokemon();
        await pumpEventQueue();

        for (int i = 0; i < testPokemon.name.length - 1; i++) {
          final value = _options[i] ?? '';
          final choiceDTO = ChoiceDTO(i, value);
          await quizViewModel.submitChoice(i, choiceDTO);
          await pumpEventQueue();
          verifyNever(() => mockAddToCapturedUseCase.call(any()));
        }
      });

      test(
          'should capture pokemon when the $AnswerDTO is same as pokemon name and $AddToCapturedUseCase returns $Right',
          () async {
        mockAddToCapturedUseCase.mockRight();

        await quizViewModel.loadPokemon();
        await pumpEventQueue();

        for (int i = 0; i < testPokemon.name.length; i++) {
          final value = _options[i] ?? '';
          final choiceDTO = ChoiceDTO(i, value);
          await quizViewModel.submitChoice(i, choiceDTO);
          await pumpEventQueue();
        }

        verify(() => mockAddToCapturedUseCase.call(any())).called(1);
        expect(quizViewModel.answerDTO?.status, CaptureStatus.caught);
      });

      test(
          'should escape pokemon when the $AnswerDTO has same length as pokemon name but name is not same',
          () async {
        mockAddToCapturedUseCase.mockRight();

        await quizViewModel.loadPokemon();
        await pumpEventQueue();

        for (int i = 1; i < testPokemon.name.length + 1; i++) {
          final value = _options[i] ?? '';
          final choiceDTO = ChoiceDTO(i, value);
          await quizViewModel.submitChoice(i, choiceDTO);
          await pumpEventQueue();
        }

        verifyNever(() => mockAddToCapturedUseCase.call(any()));
        expect(quizViewModel.answerDTO?.status, CaptureStatus.escaped);
      });

      test('should show error when $AddToCapturedUseCase returns $Left',
          () async {
        mockAddToCapturedUseCase.mockLeft();

        await quizViewModel.loadPokemon();
        await pumpEventQueue();

        for (int i = 0; i < testPokemon.name.length; i++) {
          final value = _options[i] ?? '';
          final choiceDTO = ChoiceDTO(i, value);
          await quizViewModel.submitChoice(i, choiceDTO);
          await pumpEventQueue();
        }

        verify(() => mockAddToCapturedUseCase.call(any())).called(1);
        expect(quizViewModel.errorMessage, isNotNull);
        expect(quizViewModel.isStateError, isTrue);
      });
    });
  });
}
