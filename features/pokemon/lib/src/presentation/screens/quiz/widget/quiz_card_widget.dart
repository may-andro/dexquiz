import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/screens/quiz/widget/answer_widget.dart';
import 'package:pokemon/src/presentation/screens/quiz/widget/options_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget(this.height);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            DSTextWidget(
              'Who\'s that Pokemon?',
              color: context.colorPalette.neutral.grey9,
              style: context.typography.titleLarge,
              fontFamily: FontFamily.pokemon,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            AnswerWidget(),
            SizedBox(height: context.space(factor: 2)),
            OptionsWidget(),
          ],
        ),
      ),
    );
  }
}
