import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/mapper/pokemon_type_mapper.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class HintButtonWidget extends StatelessWidget {
  const HintButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final status = viewModel.answerDTO?.status;
    if (status != CaptureStatus.guessing) return SizedBox.shrink();

    final pokemon = viewModel.questionDTO?.pokemon;
    if (pokemon == null) return SizedBox.shrink();

    final color = pokemon.types.first.getColor(context);

    return DSIconButtonWidget(
      Icons.question_mark_rounded,
      iconColor: context.colorPalette.neutral.white,
      buttonColor: color,
      elevation: context.dimens.elevationLevel2,
      onPressed: () {
        context.showBottomSheet(
          bottomSheet: DSClosableBottomSheet(
            title: 'Hint!',
            descriptions: [
              DSTextSpan(
                text: 'This wild pokemon is type: ',
                color: context.colorPalette.neutral.grey8,
                style: context.typography.bodyMedium,
              ),
              ...pokemon.types
                  .map(
                    (type) => DSTextSpan(
                      text: '${type.capitalize} ',
                      color: type.getColor(context),
                      style: context.typography.bodyLarge,
                    ),
                  )
                  .toList(),
              DSTextSpan(
                text: '\n',
                color: context.colorPalette.neutral.grey8,
                style: context.typography.bodyMedium,
              ),
              DSTextSpan(
                text: 'The pokemon starts with ',
                color: context.colorPalette.neutral.grey8,
                style: context.typography.bodyMedium,
              ),
              DSTextSpan(
                text: '${pokemon.name[0].capitalize}',
                color: color,
                style: context.typography.bodyLarge,
              ),
            ],
          ),
        );
      },
      size: DSIconButtonSize.small,
    );
  }
}
