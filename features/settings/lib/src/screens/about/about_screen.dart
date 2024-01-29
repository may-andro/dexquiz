import 'package:app_config/app_config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/module_configurator.dart';
import 'package:settings/src/screens/about/bloc/bloc.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutBloc(settingsServiceLocator.get<OpenUrlUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colorPalette.brand.primary.color,
          iconTheme: IconTheme.of(context).copyWith(
            color: context.colorPalette.brand.onPrimary.color,
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: DSTextWidget(
            'About',
            color: context.colorPalette.brand.onPrimary,
            style: context.typography.titleLarge,
          ),
        ),
        body: BlocConsumer<AboutBloc, AboutState>(listener: (context, state) {
          if (state.status == ScreenStatus.error) {
            String message =
                'Failed to fetch the relevant data, something went wrong';
            if (state.failure is InvalidUrlFailure) {
              message = 'Url is invalid, failed to open it';
            }
            if (state.failure is UrlLaunchFailure) {
              message = 'Url failed to open in the browser';
            }
            context.showSnackBar(message);
          }
        }, builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(context.space(factor: 2)),
            child: ListView(
              children: [
                _SectionWidget(
                  label: 'Description',
                  textSpans: [
                    DSTextSpan(
                      text: 'DexQuiz',
                      color: context.colorPalette.brand.primary,
                      style: context.typography.bodyLarge,
                    ),
                    DSTextSpan(
                      text:
                          ' is an open-source application designed for fun and learning purposes. Our goal is to provide users with an engaging experience while fostering a collaborative learning environment.',
                      color: context.colorPalette.neutral.grey8,
                      style: context.typography.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: context.space(factor: 2)),
                _SectionWidget(
                  label: 'Purpose',
                  textSpans: [
                    DSTextSpan(
                      text:
                          'The app is intended solely for educational and entertainment purposes. It includes content, images, and data sourced from the internet to enhance the learning experience.',
                      color: context.colorPalette.neutral.grey8,
                      style: context.typography.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: context.space(factor: 2)),
                _SectionWidget(
                  label: 'Non-Profit Nature',
                  textSpans: [
                    DSTextSpan(
                      text:
                          'We want to emphasize that the app is not created with the intention of generating any profit. It is a passion project driven by the desire to share knowledge and enjoyment with users.',
                      color: context.colorPalette.neutral.grey8,
                      style: context.typography.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: context.space(factor: 2)),
                _SectionWidget(
                  label: 'Open Source',
                  textSpans: [
                    DSTextSpan(
                      text:
                          'The project is open source, and you can explore the codebase on our ',
                      color: context.colorPalette.neutral.grey8,
                      style: context.typography.bodyMedium,
                    ),
                    DSTextSpan(
                      text: 'GitHub repository',
                      color: context.colorPalette.semantic.info,
                      style: context.typography.bodyLarge,
                      decoration: TextDecoration.underline,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.read<AboutBloc>().add(const OpenUrl());
                        },
                    ),
                    DSTextSpan(
                      text:
                          '. We encourage developers and enthusiasts to contribute, provide feedback, or even fork the project for their own educational purposes.',
                      color: context.colorPalette.neutral.grey8,
                      style: context.typography.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _SectionWidget extends StatelessWidget {
  const _SectionWidget({
    required this.label,
    required this.textSpans,
    Key? key,
  }) : super(key: key);

  final String label;
  final List<DSTextSpan> textSpans;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSTextWidget(
          label,
          color: context.colorPalette.neutral.grey9,
          style: context.typography.titleMedium,
        ),
        SizedBox(height: context.space(factor: 0.5)),
        DSRichTextWidget(children: textSpans),
      ],
    );
  }
}
