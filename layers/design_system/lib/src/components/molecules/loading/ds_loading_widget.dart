import 'package:flutter/material.dart';
import 'dart:math';
import 'package:design_system/src/components/atoms/atoms.dart';
import 'package:design_system/assets/assets.gen.dart';

class DSLoadingWidget extends StatefulWidget {
  const DSLoadingWidget({
    this.height,
    this.width,
    this.seconds = 3,
    super.key,
  });

  final int seconds;
  final double? height;
  final double? width;

  @override
  State<DSLoadingWidget> createState() => _DSLoadingWidgetState();
}

class _DSLoadingWidgetState extends State<DSLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.seconds),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: DSLocalImageWidget(
        Assets.image.badgePokemon.path,
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}
