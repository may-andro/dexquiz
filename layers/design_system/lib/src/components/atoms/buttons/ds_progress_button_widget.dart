import 'package:flutter/material.dart';
import 'package:design_system/src/components/atoms/buttons/dto/dto.dart';
import 'package:design_system/src/components/atoms/buttons/widget/base_button_widget.dart';

class DSProgressButtonWidget extends StatelessWidget {
  const DSProgressButtonWidget({
    required this.label,
    required this.onPressed,
    this.border = DSProgressButtonBorder.regular,
    this.isDisabled = false,
    this.iconDirection = DSProgressButtonIconDirection.left,
    this.icon,
    this.loadingPercentage,
    super.key,
  });

  final String label;

  final VoidCallback onPressed;

  final DSProgressButtonBorder border;

  final bool isDisabled;

  final IconData? icon;

  final DSProgressButtonIconDirection iconDirection;

  final double? loadingPercentage;

  @override
  Widget build(BuildContext context) {
    return BaseButtonWidget(
      content: _content,
      onPressed: onPressed,
      variant: PrimaryVariant(),
      border: border.border,
      isDisabled: isDisabled,
      loading: loadingPercentage != null && loadingPercentage! < 1
          ? LinearLoading(loadingPercentage!)
          : null,
    );
  }

  ContentDTO get _content {
    final iconData = icon;
    if (iconData == null) {
      return TextContent(label);
    }
    if (iconDirection == DSProgressButtonIconDirection.left) {
      return LeftIconTextContent(label, iconData);
    }
    return RightIconTextContent(label, iconData);
  }
}

enum DSProgressButtonBorder {
  regular,
  rounded;

  BorderDTO get border {
    switch (this) {
      case regular:
        return RegularBorder();
      case rounded:
        return RoundedBorder();
    }
  }
}

enum DSProgressButtonIconDirection { left, right }
