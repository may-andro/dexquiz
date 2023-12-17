import 'package:flutter/material.dart';

class DSLocalImageWidget extends StatelessWidget {
  const DSLocalImageWidget(
    this.path, {
    this.height,
    this.width,
    super.key,
  });

  final String path;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      package: 'design_system',
    );
  }
}
