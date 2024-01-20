import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DSLottieWidget extends StatelessWidget {
  const DSLottieWidget(
    this.path, {
    this.repeat = false,
    this.size,
    super.key,
  });

  final String path;
  final bool repeat;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      path,
      height: size,
      width: size,
      package: 'design_system',
      repeat: repeat,
    );
  }
}
