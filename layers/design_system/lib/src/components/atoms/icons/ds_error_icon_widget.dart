import 'package:design_system/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DSErrorIconWidget extends StatelessWidget {
  const DSErrorIconWidget({
    this.height,
    this.width,
    super.key,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.lottieFiles.error,
      package: 'design_system',
      repeat: true,
      height: height,
      width: width,
    );
  }
}
