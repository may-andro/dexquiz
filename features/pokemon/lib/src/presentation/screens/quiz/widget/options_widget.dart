import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:pokemon/src/presentation/screens/quiz/widget/choice_card_widget.dart';
import 'package:provider/provider.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final choices = viewModel.questionDTO?.choices;
    final answered = viewModel.answerDTO?.answers.values;
    final captureStatus = viewModel.answerDTO?.status;
    if (choices == null || answered == null || captureStatus == null) {
      return SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DSTextWidget(
          'Drag the cards to complete the name',
          color: context.colorPalette.neutral.grey9,
          style: context.typography.bodyLarge,
          fontFamily: FontFamily.pokemon,
          textAlign: TextAlign.center,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            top: context.space(factor: 1),
            bottom: MediaQuery.paddingOf(context).bottom,
          ),
          color: context.colorPalette.neutral.grey4.color.withOpacity(0.5),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: context.space(factor: 0.5),
            runSpacing: context.space(factor: 0.5),
            children: choices.map(
              (choice) {
                return _ChoicesCardWidget(
                  choice,
                  isEnabled: !answered.contains(choice) &&
                      captureStatus != CaptureStatus.caught,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class _ChoicesCardWidget extends StatelessWidget {
  const _ChoicesCardWidget(
    this.choice, {
    required this.isEnabled,
  });

  final ChoiceDTO choice;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Draggable<ChoiceDTO>(
      data: choice,
      child: _buildChoices(context),
      feedback: _buildChoices(context),
      childWhenDragging: _buildChoices(context),
    );
  }

  Widget _buildChoices(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: ChoiceCardWidget(
        choice.char,
        isEnabled: isEnabled,
        color: context.colorPalette.neutral.grey9,
      ),
    );
  }
}
