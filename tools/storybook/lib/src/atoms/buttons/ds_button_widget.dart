import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Button Widget',
  type: ButtonWidget,
)
ButtonWidget buttonWidget(BuildContext context) {
  return const ButtonWidget();
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSButtonWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSButtonWidget(
            label: 'Click Me!',
            onPressed: () {},
            isLoading: context.knobs.boolean(
              label: 'loading state',
              initialValue: false,
            ),
            isDisabled: context.knobs.boolean(
              label: 'disabled state',
              initialValue: false,
            ),
            variant: context.knobs
                .list<Option<DSButtonVariant>>(
                  label: 'Variant',
                  options: [
                    Option(DSButtonVariant.primary, 'Primary'),
                    Option(DSButtonVariant.secondary, 'Secondary'),
                    Option(DSButtonVariant.error, 'Error'),
                    Option(DSButtonVariant.text, 'Text'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            border: context.knobs
                .list<Option<DSButtonBorder>>(
                  label: 'Border',
                  options: [
                    Option(DSButtonBorder.regular, 'Regular'),
                    Option(DSButtonBorder.rounded, 'Rounded'),
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
                .list<Option<DSButtonIconDirection>>(
                  label: 'Icon Direction',
                  options: [
                    Option(DSButtonIconDirection.left, 'Left'),
                    Option(DSButtonIconDirection.right, 'Right'),
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
