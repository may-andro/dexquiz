import 'package:flutter/material.dart';
import 'package:design_system/src/foundations/colors/colors.dart';

class DSAssetImageWidget extends StatelessWidget {
  const DSAssetImageWidget(
    this.path, {
    this.height,
    this.width,
    this.color,
    this.boxFit,
    this.package,
    super.key,
  });

  final String path;
  final double? height;
  final double? width;
  final DSColor? color;
  final BoxFit? boxFit;
  final String? package;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      color: color?.color,
      package: package ?? 'design_system',
      fit: boxFit,
    );
  }
}
