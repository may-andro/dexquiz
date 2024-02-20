import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    this.errorLabel,
    this.error,
    this.cause,
    this.onRetry,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onRetry;
  final String? error;
  final String? cause;
  final String? errorLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.space(factor: 3)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: context.space(factor: 8),
            height: context.space(factor: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorPalette.semantic.error.color,
            ),
            padding: EdgeInsets.all(context.space(factor: 1.5)),
            child: DSErrorIconWidget(),
          ),
          SizedBox(height: context.space(factor: 2)),
          DSTextWidget(
            errorLabel ?? 'Ooops...',
            color: context.colorPalette.neutral.grey9,
            style: context.typography.titleLarge,
          ),
          SizedBox(height: context.space(factor: 2)),
          DSRichTextWidget(
            children: [
              DSTextSpan(
                text: error ?? 'Something went wrong!',
                color: context.colorPalette.neutral.grey7,
                style: context.typography.labelMedium,
              ),
              if (cause != null) ...[
                DSTextSpan(
                  text: cause!,
                  color: context.colorPalette.neutral.grey8,
                  style: context.typography.labelLarge,
                ),
              ]
            ],
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.space(factor: 4)),
          if (onRetry != null) ...[
            SizedBox(
              width: context.space(factor: 12),
              child: DSButtonWidget(
                label: 'Retry',
                icon: Icons.refresh_rounded,
                iconDirection: DSButtonIconDirection.right,
                onPressed: onRetry!,
                size: DSButtonSize.small,
                border: DSButtonBorder.rounded,
                variant: DSButtonVariant.error,
              ),
            )
          ]
        ],
      ),
    );
  }
}
