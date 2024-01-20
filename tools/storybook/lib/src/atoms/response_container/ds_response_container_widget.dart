import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Responsive Container Widget',
  type: ResponsiveContainerWidget,
)
ResponsiveContainerWidget textWidget(BuildContext context) {
  return const ResponsiveContainerWidget();
}

class ResponsiveContainerWidget extends StatelessWidget {
  const ResponsiveContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSTextWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSResponsiveContainerWidget(
            mobileBuilder: (BuildContext context) {
              return DSTextWidget(
                'Mobile Version',
                color: context.colorPalette.brand.primary,
                style: context.typography.titleMedium,
              );
            },
            tabletBuilder: (BuildContext context) {
              return DSTextWidget(
                'Tablet Version',
                color: context.colorPalette.brand.secondary,
                style: context.typography.titleMedium,
              );
            },
            desktopBuilder: (BuildContext context) {
              return DSTextWidget(
                'Desktop Version',
                color: context.colorPalette.brand.tertiary,
                style: context.typography.titleMedium,
              );
            },
          ),
        ),
      ),
    );
  }
}
