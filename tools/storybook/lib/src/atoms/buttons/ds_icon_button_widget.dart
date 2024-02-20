import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Icon Button Widget',
  type: ButtonProgressWidget,
)
ButtonProgressWidget iconButtonWidget(BuildContext context) {
  return const ButtonProgressWidget();
}

class ButtonProgressWidget extends StatelessWidget {
  const ButtonProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSIconButtonWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSIconButtonWidget(
            context.knobs
                .list<Option<IconData>>(
                  label: 'Icon',
                  options: [
                    Option(Icons.catching_pokemon, 'Pokemon'),
                    Option(Icons.percent, 'Percent'),
                    Option(Icons.place, 'Place'),
                    Option(Icons.close, 'Close'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            elevation: context.knobs
                .list<Option<DSElevation>>(
                  label: 'Elevation',
                  options: [
                    Option(context.dimens.elevationLevel1, 'Level1'),
                    Option(context.dimens.elevationLevel2, 'Level2'),
                    Option(context.dimens.elevationLevel3, 'Level3'),
                    Option(context.dimens.elevationNone, 'None'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            onPressed: () {},
            buttonColor: context.knobs
                .list<Option<DSColor>>(
                  label: 'Button Color',
                  options: [
                    Option(context.colorPalette.brand.primary, 'Primary'),
                    Option(context.colorPalette.brand.secondary, 'Secondary'),
                    Option(context.colorPalette.semantic.error, 'Error'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            iconColor: context.knobs
                .list<Option<DSColor>>(
                  label: 'Icon Color',
                  options: [
                    Option(context.colorPalette.brand.primary, 'Primary'),
                    Option(context.colorPalette.brand.secondary, 'Secondary'),
                    Option(context.colorPalette.semantic.error, 'Error'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            size: context.knobs
                .list<Option<DSIconButtonSize>>(
                  label: 'Size',
                  options: [
                    Option(DSIconButtonSize.small, 'Small'),
                    Option(DSIconButtonSize.medium, 'Medium'),
                    Option(DSIconButtonSize.large, 'Large'),
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
