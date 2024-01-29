import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Lottie Widget',
  type: LottieWidget,
)
LottieWidget buttonWidget(BuildContext context) {
  return const LottieWidget();
}

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSLottieWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSLottieWidget(
            context.knobs
                .list<Option<String>>(
                  label: 'Select Files',
                  options: [
                    Option(Assets.lottieFiles.kanto, 'Kanto'),
                    Option(Assets.lottieFiles.jhoto, 'Johto'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            repeat: context.knobs.boolean(
              label: 'Repeat',
              initialValue: false,
            ),
            size: context.knobs.doubleOrNull
                .slider(
                  label: 'Size',
                  min: 0,
                  initialValue: null,
                  max: context.screenHeight,
                  divisions: 10,
                )
                ?.toDouble(),
          ),
        ),
      ),
    );
  }
}
