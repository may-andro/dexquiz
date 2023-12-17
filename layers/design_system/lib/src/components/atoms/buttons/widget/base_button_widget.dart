import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:design_system/src/components/atoms/buttons/dto/dto.dart';

@internal
class BaseButtonWidget extends StatelessWidget {
  const BaseButtonWidget({
    required this.content,
    required this.loading,
    required this.variant,
    required this.border,
    required this.onPressed,
    required this.isDisabled,
    super.key,
  });

  final ContentDTO content;

  final LoadingDTO? loading;

  final VariantDTO variant;

  final BorderDTO border;

  final VoidCallback onPressed;

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: variant.getOverlayColor(context),
        foregroundColor: variant.getForegroundColor(context, isDisabled),
        backgroundColor: variant.getBackgroundColor(context, isDisabled),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
          return border.getOutlinedBorder(context);
        }),
        side: variant.getSide(context, isDisabled, loading),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed:
          isDisabled || (loading?.blockClicks ?? false) ? null : onPressed,
      child: _ButtonChildWidget(
        content: content,
        variant: variant,
        isDisabled: isDisabled,
        loading: loading,
        border: border,
      ),
    );
  }
}

class _ButtonChildWidget extends StatelessWidget {
  const _ButtonChildWidget({
    required this.content,
    required this.loading,
    required this.variant,
    required this.border,
    required this.isDisabled,
  });

  final ContentDTO content;

  final LoadingDTO? loading;

  final VariantDTO variant;

  final BorderDTO border;

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    if (loading != null) {
      return _getLoadingContent(context);
    }
    return Center(child: content.getContentWidget(context));
  }

  Widget _getLoadingContent(BuildContext context) {
    final tempLoading = loading;
    if (tempLoading == null) return const SizedBox.shrink();

    if (tempLoading is LinearLoading<dynamic>) {
      return Stack(
        children: [
          if (!isDisabled) ...[
            tempLoading.getContentWidget(border.getBorderRadius(context)),
          ],
          Center(child: content.getContentWidget(context)),
        ],
      );
    }

    if (tempLoading is CircularLoading<dynamic>) {
      return Center(
        child: tempLoading.getContentWidget(
          isDisabled
              ? variant.getDisabledTextColor(context)
              : variant.getDefaultTextColor(context),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

extension _VariantDTOExtension on VariantDTO {
  MaterialStateProperty<Color?> getOverlayColor(BuildContext context) {
    return MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        return states.contains(MaterialState.focused)
            ? getDefaultBackgroundColor(context)
            : getPressedBackgroundColor(context);
      },
    );
  }

  MaterialStateProperty<Color?> getForegroundColor(
    BuildContext context,
    bool isDisabled,
  ) {
    return MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled) && isDisabled) {
          return getDisabledTextColor(context);
        }
        if (states.contains(MaterialState.pressed)) {
          return getPressedTextColor(context);
        }
        return getDefaultTextColor(context);
      },
    );
  }

  MaterialStateProperty<Color?> getBackgroundColor(
    BuildContext context,
    bool isDisabled,
  ) {
    return MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled) && isDisabled) {
        return getDisabledBackgroundColor(context);
      }
      return getDefaultBackgroundColor(context);
    });
  }

  MaterialStateProperty<BorderSide?> getSide(
    BuildContext context,
    bool isDisabled,
    LoadingDTO? loading,
  ) {
    return MaterialStateProperty.resolveWith<BorderSide?>((states) {
      var color = getDefaultBorderColor(context);
      if (states.contains(MaterialState.disabled) && isDisabled) {
        color = getDisabledBorderColor(context);
      }
      if (states.contains(MaterialState.pressed)) {
        color = getPressedBorderColor(context);
      }
      if (loading != null && loading is LinearLoading) {
        color = Colors.transparent;
      }
      return BorderSide(color: color);
    });
  }
}
