import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'FAB Widget',
  type: FabWidget,
)
FabWidget iconButtonWidget(BuildContext context) {
  return const FabWidget();
}

class FabWidget extends StatelessWidget {
  const FabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSProgressButtonWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSFabWidget(
            fabType: context.knobs
                .list<Option<DSFabType>>(
                  label: 'Fab Type',
                  options: [
                    Option(
                      DSFabImage(Assets.images.badgeLugia.path),
                      'Image',
                    ),
                    Option(DSFabIcon(Icons.ice_skating), 'Icon'),
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
            toolTipLabel: context.knobs
                .list<Option<String?>>(
                  label: 'Color',
                  options: [
                    Option(null, 'No Tooltip'),
                    Option('Tool Tip', 'With Tooltip'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            color: context.knobs
                .list<Option<DSColor>>(
                  label: 'Color',
                  options: [
                    Option(context.colorPalette.brand.primary, 'Primary'),
                    Option(context.colorPalette.brand.secondary, 'Secondary'),
                    Option(context.colorPalette.semantic.error, 'Error'),
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
