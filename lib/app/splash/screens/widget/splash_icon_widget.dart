import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashIconWidget extends StatelessWidget {
  const SplashIconWidget(this._imagePath, {super.key});

  final String _imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenWidth * 0.8,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Image.asset(_imagePath),
        ),
      ),
    );
  }
}
