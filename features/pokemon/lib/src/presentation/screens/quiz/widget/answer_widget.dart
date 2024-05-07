import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:pokemon/src/presentation/screens/quiz/widget/choice_card_widget.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final pokemon = viewModel.questionDTO?.pokemon;

    if (pokemon == null) {
      return SizedBox.shrink();
    }

    return _ChoicesWidget(
      name: pokemon.name,
      color: pokemon.types.first.getColor(context),
      answers: viewModel.answerDTO?.answers ?? {},
      isCaptured: viewModel.answerDTO?.status == CaptureStatus.caught,
      onSubmitChoice: viewModel.submitChoice,
    );
  }
}

class _ChoicesWidget extends StatelessWidget {
  const _ChoicesWidget({
    required this.name,
    required this.color,
    required this.isCaptured,
    required this.answers,
    required this.onSubmitChoice,
  });

  final String name;
  final DSColor color;
  final bool isCaptured;
  final Map<int, ChoiceDTO> answers;
  final Function(int, ChoiceDTO) onSubmitChoice;

  @override
  Widget build(BuildContext context) {
    final optionWidgets = <Widget>[];
    for (int i = 0; i < name.length; i++) {
      optionWidgets.add(
        _ChoiceWidget(
          answers[i]?.char ?? '?',
          color: color,
          isEnabled: answers.keys.contains(i),
          onSubmit: (data) => onSubmitChoice(i, data),
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: context.space(factor: 1)),
      color: isCaptured ? Colors.transparent : color.color.withOpacity(0.5),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: context.space(factor: 0.5),
        runSpacing: context.space(factor: 0.5),
        children: optionWidgets,
      ),
    );
  }
}

class _ChoiceWidget extends StatelessWidget {
  const _ChoiceWidget(
    this.char, {
    required this.color,
    required this.isEnabled,
    required this.onSubmit,
  });

  final String char;
  final DSColor color;
  final bool isEnabled;
  final Function(ChoiceDTO) onSubmit;

  @override
  Widget build(BuildContext context) {
    return DragTarget<ChoiceDTO>(
      builder: (context, incoming, rejected) {
        return ChoiceCardWidget(
          char,
          color: color,
          isEnabled: isEnabled,
        );
      },
      onWillAcceptWithDetails: (data) => true,
      onAcceptWithDetails: (dragDetailTarget) {
        onSubmit(dragDetailTarget.data);
      },
    );
  }
}
