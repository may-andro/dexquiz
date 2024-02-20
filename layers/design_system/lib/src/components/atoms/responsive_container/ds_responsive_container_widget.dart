import 'package:design_system/src/components/atoms/responsive_container/device_resolution.dart';
import 'package:design_system/src/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSResponsiveContainerWidget extends StatelessWidget {
  const DSResponsiveContainerWidget({
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
    super.key,
  });

  final WidgetBuilder mobileBuilder;
  final WidgetBuilder tabletBuilder;
  final WidgetBuilder desktopBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (context.deviceResolution) {
          case DeviceResolution.mobile:
            return mobileBuilder(context);
          case DeviceResolution.tablet:
            return tabletBuilder(context);
          case DeviceResolution.desktop:
            return desktopBuilder(context);
          default:
            return mobileBuilder(context);
        }
      },
    );
  }
}
