import 'package:flutter/material.dart';
import 'package:design_system/src/foundations/foundations.dart';

class DSTextWidget extends StatelessWidget {
  const DSTextWidget(
    this.data, {
    required this.color,
    required this.style,
    this.decoration = TextDecoration.none,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.softWrap,
    this.textOverflow,
    this.textHeightBehavior,
    super.key,
  });

  final String data;
  final DSTextStyle style;
  final DSColor color;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style.textStyle.copyWith(
        color: color.color,
        decoration: decoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      softWrap: softWrap,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
