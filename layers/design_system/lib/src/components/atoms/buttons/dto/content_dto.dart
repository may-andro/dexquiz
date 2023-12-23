import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:design_system/src/extensions/build_context_extension.dart';

@internal
abstract interface class ContentDTO {
  final String label;
  final IconData? left;
  final IconData? right;

  ContentDTO(this.label, {this.left, this.right});

  Widget getContentWidget(BuildContext context);
}

@internal
class TextContent extends ContentDTO {
  TextContent(super.label) : super(left: null, right: null);

  @override
  Widget getContentWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: context.space(factor: 2)),
        _TextContentWidget(label),
        SizedBox(width: context.space(factor: 2)),
      ],
    );
  }
}

@internal
class LeftIconTextContent extends ContentDTO {
  LeftIconTextContent(
    super.label,
    IconData left,
  ) : super(left: left, right: null);

  @override
  Widget getContentWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: context.space(factor: 2)),
        _ImageContextWidget(left!),
        SizedBox(width: context.space(factor: 0.5)),
        _TextContentWidget(label),
        SizedBox(width: context.space(factor: 2)),
      ],
    );
  }
}

@internal
class RightIconTextContent extends ContentDTO {
  RightIconTextContent(
    super.label,
    IconData right,
  ) : super(left: null, right: right);

  @override
  Widget getContentWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: context.space(factor: 2)),
        _TextContentWidget(label),
        SizedBox(width: context.space(factor: 0.5)),
        _ImageContextWidget(right!),
        SizedBox(width: context.space(factor: 2)),
      ],
    );
  }
}

class _ImageContextWidget extends StatelessWidget {
  const _ImageContextWidget(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: context.space(factor: 2.5));
  }
}

class _TextContentWidget extends StatelessWidget {
  const _TextContentWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.typography.labelLarge.textStyle,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
