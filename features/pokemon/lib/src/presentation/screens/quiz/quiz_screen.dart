import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:pokemon/src/presentation/screens/quiz/widget/widget.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProviderWidget<QuizViewModel>(
          onViewModelProvided: (viewModel) async => await viewModel.onInit(),
          builder: (context, viewModel, widget) {
            return Column(
              children: [
                TitleWidget(),
                Expanded(child: QuestionWidget()),
                ViewStateBuilderWidget(
                  viewState: viewModel.viewState,
                  loadingBuilder: loadingBuilder,
                  builder: builder,
                  errorBuilder: errorBuilder,
                ),
              ],
            );
          }),
    );
  }

  Widget loadingBuilder(BuildContext context) {
    return SlidingPanelWidget(
      context.height * 0.2,
      child: LoadingCardWidget(key: const Key('quiz_loading_widget')),
    );
  }

  Widget builder(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    Widget child = SizedBox.shrink();
    double height = 0.0;
    switch (viewModel.answerDTO?.status) {
      case CaptureStatus.caught:
        {
          height = context.space(factor: 20);
          child = CapturedCardWidget(key: const Key('quiz_captured_widget'));
        }
      case CaptureStatus.escaped:
        {
          height = context.screenHeight * 0.3;
          child = EscapedCardWidget(key: const Key('quiz_escaped_widget'));
        }
      default:
        {
          final optionCount = viewModel.questionDTO?.choices.length ?? 0;
          final nameCount = viewModel.questionDTO?.pokemon.name.length ?? 0;
          final width = context.width - context.space(factor: 6);
          final optionPerRow = width / context.space(factor: 6);

          int optionRow = (optionCount / optionPerRow).ceil();
          int nameRow = (nameCount / optionPerRow).ceil();

          height = context.space(factor: 14.0 + (8 * (optionRow + nameRow)));
          child = QuizCardWidget(height, key: const Key('quiz_card_widget'));
        }
    }
    return SlidingPanelWidget(height, child: child);
  }

  Widget errorBuilder(BuildContext context) {
    return SlidingPanelWidget(
      context.height * 0.2,
      child: ErrorCardWidget(key: const Key('quiz_error_widget')),
    );
  }
}
