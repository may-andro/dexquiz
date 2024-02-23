import 'package:dependency_injector/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/module_configurator.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/answer_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_screen.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';

import '../../../mock/presentation/quiz/mock_quiz_view_model.dart';
import '../../../utils/test_widget_wrapper.dart';

class MockServiceLocator extends Mock implements ServiceLocator {}

void main() {
  group(QuizScreen, () {
    late Widget widget;

    late MockQuizViewModel mockQuizViewModel;

    setUp(() {
      mockQuizViewModel = MockQuizViewModel();
      pokemonServiceLocator = MockServiceLocator();
      when(() => pokemonServiceLocator.get<QuizViewModel>()).thenReturn(
        mockQuizViewModel,
      );

      widget = const TestWidgetWrapper(child: QuizScreen());
    });

    group('loading widget', () {
      testWidgets(
          'should show loading widget '
          'when view state is ${ViewState.loading}', (tester) async {
        mockQuizViewModel.mockOnInit();
        mockQuizViewModel.mockViewState(ViewState.loading);

        await tester.pumpWidget(widget);
        await tester.pump(const Duration(milliseconds: 1));

        expect(find.byKey(Key('quiz_loading_widget')), findsOneWidget);
        expect(find.byKey(Key('quiz_error_widget')), findsNothing);
        expect(find.byKey(Key('quiz_card_widget')), findsNothing);
        expect(find.byKey(Key('quiz_escaped_widget')), findsNothing);
        expect(find.byKey(Key('quiz_captured_widget')), findsNothing);
      });
    });

    group('error widget', () {
      testWidgets(
          'should show loading widget '
          'when view state is ${ViewState.error}', (tester) async {
        mockQuizViewModel.mockOnInit();
        mockQuizViewModel.mockViewState(ViewState.error);

        await tester.pumpWidget(widget);
        await tester.pump(const Duration(milliseconds: 1));

        expect(find.byKey(Key('quiz_loading_widget')), findsNothing);
        expect(find.byKey(Key('quiz_error_widget')), findsOneWidget);
        expect(find.byKey(Key('quiz_card_widget')), findsNothing);
        expect(find.byKey(Key('quiz_escaped_widget')), findsNothing);
        expect(find.byKey(Key('quiz_captured_widget')), findsNothing);
      });
    });

    group('success widget', () {
      testWidgets(
        'should show quiz card widget '
        'when view state is ${ViewState.success} & capture status is ${CaptureStatus.guessing} ',
        (tester) async {
          mockQuizViewModel.mockOnInit();
          mockQuizViewModel.mockViewState(ViewState.success);
          mockQuizViewModel.mockAnswerDTO(AnswerDTO.empty().copyWith(
            answers: {},
            status: CaptureStatus.guessing,
          ));

          await tester.pumpWidget(widget);
          await tester.pump(const Duration(milliseconds: 1));

          expect(find.byKey(Key('quiz_loading_widget')), findsNothing);
          expect(find.byKey(Key('quiz_error_widget')), findsNothing);
          expect(find.byKey(Key('quiz_card_widget')), findsOneWidget);
          expect(find.byKey(Key('quiz_escaped_widget')), findsNothing);
          expect(find.byKey(Key('quiz_captured_widget')), findsNothing);
        },
      );

      testWidgets(
        'should show caught card widget '
        'when view state is ${ViewState.success} & capture status is ${CaptureStatus.caught} ',
        (tester) async {
          mockQuizViewModel.mockOnInit();
          mockQuizViewModel.mockViewState(ViewState.success);
          mockQuizViewModel.mockAnswerDTO(AnswerDTO.empty().copyWith(
            answers: {},
            status: CaptureStatus.caught,
          ));

          await tester.pumpWidget(widget);
          await tester.pump(const Duration(milliseconds: 1));

          expect(find.byKey(Key('quiz_loading_widget')), findsNothing);
          expect(find.byKey(Key('quiz_error_widget')), findsNothing);
          expect(find.byKey(Key('quiz_card_widget')), findsNothing);
          expect(find.byKey(Key('quiz_escaped_widget')), findsNothing);
          expect(find.byKey(Key('quiz_captured_widget')), findsOneWidget);
        },
      );

      testWidgets(
        'should show escaped card widget '
        'when view state is ${ViewState.success} & capture status is ${CaptureStatus.escaped} ',
        (tester) async {
          mockQuizViewModel.mockOnInit();
          mockQuizViewModel.mockViewState(ViewState.success);
          mockQuizViewModel.mockAnswerDTO(AnswerDTO.empty().copyWith(
            answers: {},
            status: CaptureStatus.escaped,
          ));

          await tester.pumpWidget(widget);
          await tester.pump(const Duration(milliseconds: 1));

          expect(find.byKey(Key('quiz_loading_widget')), findsNothing);
          expect(find.byKey(Key('quiz_error_widget')), findsNothing);
          expect(find.byKey(Key('quiz_card_widget')), findsNothing);
          expect(find.byKey(Key('quiz_escaped_widget')), findsOneWidget);
          expect(find.byKey(Key('quiz_captured_widget')), findsNothing);
        },
      );
    });
  });
}
