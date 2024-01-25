import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/screens/setting/bloc/bloc.dart';

class VersionTextWidget extends StatelessWidget {
  const VersionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        final settingsDTO = state.settingsDTO;
        if (settingsDTO != null && settingsDTO.appVersion.isNotEmpty) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.space(factor: 1)),
              child: DSTextWidget(
                'Version: ${settingsDTO.appVersion}',
                color: context.colorPalette.neutral.grey8,
                style: context.typography.labelLarge,
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
