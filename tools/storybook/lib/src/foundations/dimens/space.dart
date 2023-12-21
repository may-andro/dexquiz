import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Space',
  type: SpaceDimension,
)
SpaceDimension spaceDimension(BuildContext context) {
  return const SpaceDimension();
}

class SpaceDimension extends StatelessWidget {
  const SpaceDimension({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'Space',
      child: Center(
        child: Card(
          color: context.colorPalette.brand.primary.color,
          child: SizedBox(
            height: context.knobs
                    .list(label: 'Factor', options: [1, 5, 10, 20, 30]) *
                context.dimens.grid.value,
            width: context.knobs
                    .list(label: 'Factor', options: [1, 5, 10, 20, 30]) *
                context.dimens.grid.value,
          ),
        ),
      ),
    );
  }
}
