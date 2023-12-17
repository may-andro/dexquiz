import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:design_system/src/foundations/foundations.dart';

class DSRichTextWidget extends StatelessWidget {
  const DSRichTextWidget({
    required this.children,
    this.maxLines,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
    super.key,
  });

  final List<DSTextSpan> children;
  final int? maxLines;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      text: TextSpan(children: children.map((e) => e.toTextSpan()).toList()),
      softWrap: softWrap,
    );
  }
}

class DSTextSpan {
  const DSTextSpan({
    required this.text,
    required this.color,
    required this.style,
    this.recognizer,
    this.decoration,
  });

  final String text;
  final DSColor color;
  final DSTextStyle style;
  final GestureRecognizer? recognizer;
  final TextDecoration? decoration;
}

extension _KrnTextSpanExtension on DSTextSpan {
  TextSpan toTextSpan() {
    return TextSpan(
      text: text,
      style: style.textStyle.copyWith(
        color: color.color,
        decoration: decoration,
      ),
      recognizer: recognizer,
    );
  }
}
