import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/screens/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class ErrorCardWidget extends StatelessWidget {
  const ErrorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuizViewModel>();
    final error = viewModel.errorMessage;

    if (error == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.all(context.space(factor: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DSTextWidget(
            'Oops...',
            color: context.colorPalette.semantic.error,
            style: context.typography.titleLarge,
            fontFamily: FontFamily.pokemon,
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
          ),
          DSTextWidget(
            error,
            color: context.colorPalette.neutral.grey7,
            style: context.typography.bodyLarge,
            fontFamily: FontFamily.pokemon,
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
          ),
        ],
      ),
    );
  }
}
