import 'package:flutter/material.dart';

class DSSpaceWidget extends StatelessWidget {
  const DSSpaceWidget(
    this.space, {
    this.isHorizontal = false,
    super.key,
  });

  final double space;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return SizedBox(width: space);
    }
    return SizedBox(height: space);
  }
}
