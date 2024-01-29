import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LaunchTabletWidget extends StatelessWidget {
  const LaunchTabletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LaunchHeaderWidget(),
        const Spacer(),
        const LaunchImageWidget(),
        const Spacer(),
        SizedBox(height: context.space(factor: 5)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
          child: const LaunchButtonsWidget(),
        ),
        SizedBox(height: context.space(factor: 5)),
      ],
    );
  }
}
