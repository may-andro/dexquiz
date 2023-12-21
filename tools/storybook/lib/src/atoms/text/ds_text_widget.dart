import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/model/option.dart';
import 'package:storybook/src/widgets/base_scaffold_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Text Widget',
  type: TextWidget,
)
TextWidget textWidget(BuildContext context) {
  return const TextWidget();
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: 'DSTextWidget',
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.space(factor: 2)),
          child: DSTextWidget(
            context.knobs
                .list<Option<String>>(
                  label: 'Text',
                  options: [
                    Option('Hello World!', 'Short Text'),
                    Option(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                      'Medium Text',
                    ),
                    Option(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
                          'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
                          'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      'Large Text',
                    ),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            color: context.knobs
                .list<Option<DSColor>>(
                  label: 'Color',
                  options: [
                    Option(context.colorPalette.neutral.grey10, 'Grey10'),
                    Option(context.colorPalette.neutral.grey9, 'Grey9'),
                    Option(context.colorPalette.neutral.grey8, 'Grey8'),
                    Option(context.colorPalette.neutral.grey7, 'Grey7'),
                    Option(context.colorPalette.neutral.grey6, 'Grey6'),
                    Option(context.colorPalette.neutral.grey5, 'Grey5'),
                    Option(context.colorPalette.neutral.grey4, 'Grey4'),
                    Option(context.colorPalette.neutral.grey3, 'Grey3'),
                    Option(context.colorPalette.neutral.grey2, 'Grey2'),
                    Option(context.colorPalette.neutral.grey1, 'Grey1'),
                    Option(context.colorPalette.brand.primary, 'Primary'),
                    Option(context.colorPalette.brand.secondary, 'Secondary'),
                    Option(context.colorPalette.brand.tertiary, 'Tertiary'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            style: context.knobs
                .list<Option<DSTextStyle>>(
                  label: 'Text Style',
                  options: [
                    Option(context.typography.headlineLarge, 'Headline Large'),
                    Option(
                      context.typography.headlineMedium,
                      'Headline Medium',
                    ),
                    Option(context.typography.headlineSmall, 'Headline Small'),
                    Option(context.typography.displayLarge, 'Display Large'),
                    Option(context.typography.displayMedium, 'Display Medium'),
                    Option(context.typography.displaySmall, 'Display Small'),
                    Option(context.typography.titleLarge, 'Title Large'),
                    Option(context.typography.titleMedium, 'Title Medium'),
                    Option(context.typography.titleSmall, 'Title Small'),
                    Option(context.typography.labelLarge, 'Label Large'),
                    Option(context.typography.labelMedium, 'Label Medium'),
                    Option(context.typography.labelSmall, 'Label Small'),
                    Option(context.typography.bodyLarge, 'Body Large'),
                    Option(context.typography.bodyMedium, 'Body Medium'),
                    Option(context.typography.bodySmall, 'Body Small'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            textOverflow: context.knobs
                .list<Option<TextOverflow?>>(
                  label: 'Text Overflow',
                  options: [
                    Option(null, 'None'),
                    Option(TextOverflow.ellipsis, 'Ellipsis'),
                    Option(TextOverflow.fade, 'Fade'),
                    Option(TextOverflow.clip, 'Clip'),
                    Option(TextOverflow.visible, 'Visible'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            textAlign: context.knobs
                .list<Option<TextAlign>>(
                  label: 'Text Overflow',
                  options: [
                    Option(TextAlign.left, 'Left'),
                    Option(TextAlign.right, 'Right'),
                    Option(TextAlign.start, 'Start'),
                    Option(TextAlign.end, 'End'),
                    Option(TextAlign.center, 'Center'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            decoration: context.knobs
                .list<Option<TextDecoration>>(
                  label: 'Text Decoration',
                  options: [
                    Option(TextDecoration.none, 'None'),
                    Option(TextDecoration.underline, 'Underline'),
                    Option(TextDecoration.overline, 'Over Line'),
                    Option(TextDecoration.lineThrough, 'Line Through'),
                  ],
                  labelBuilder: (option) => option.label,
                )
                .value,
            maxLines: context.knobs.listOrNull(
              label: 'Max Lines',
              options: [1, 2, 3, 5, 10],
            ),
            softWrap: context.knobs.booleanOrNull(label: 'Soft Wrap'),
          ),
        ),
      ),
    );
  }
}
