import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LaunchMobileWidget extends StatelessWidget {
  const LaunchMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LaunchHeaderWidget(),
        const Spacer(),
        const LaunchImageWidget(),
        const Spacer(),
        const LaunchButtonsWidget(),
        SizedBox(height: context.space(factor: 3)),
      ],
    );
  }
}
