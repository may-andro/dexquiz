import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Progress Button Widget',
  type: ProgressButtonWidget,
)
ProgressButtonWidget progressButtonWidget(BuildContext context) {
  return const ProgressButtonWidget();
}

class ProgressButtonWidget extends StatelessWidget {
  const ProgressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSProgressButtonWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSProgressButtonWidget(
            label: 'Click Me!',
            onPressed: () {},
            loadingPercentage: context.knobs.double.slider(
              label: 'Progress',
              initialValue: 0,
              max: 1,
              min: 0,
            ),
            isDisabled: context.knobs.boolean(
              label: 'disabled state',
              initialValue: false,
            ),
            border: context.knobs
                .list<Option<DSProgressButtonBorder>>(
                  label: 'Border',
                  options: [
                    Option(DSProgressButtonBorder.regular, 'Regular'),
                    Option(DSProgressButtonBorder.rounded, 'Rounded'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            icon: context.knobs
                .list<Option<IconData?>>(
                  label: 'Icon',
                  options: [
                    Option(null, 'No Icon'),
                    Option(Icons.access_time, 'Icon')
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            iconDirection: context.knobs
                .list<Option<DSProgressButtonIconDirection>>(
                  label: 'Icon Direction',
                  options: [
                    Option(DSProgressButtonIconDirection.left, 'Left'),
                    Option(DSProgressButtonIconDirection.right, 'Right'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
          ),
        ),
      ),
    );
  }
}
