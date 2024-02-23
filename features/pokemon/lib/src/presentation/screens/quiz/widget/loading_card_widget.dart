import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoadingCardWidget extends StatelessWidget {
  const LoadingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DSLoadingWidget(
          height: context.height * 0.1,
        ),
        DSTextWidget(
          'Looking for a wild pokemon...',
          color: context.colorPalette.neutral.grey7,
          style: context.typography.bodyLarge,
          fontFamily: FontFamily.pokemon,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
          ),
        ),
      ],
    );
  }
}
