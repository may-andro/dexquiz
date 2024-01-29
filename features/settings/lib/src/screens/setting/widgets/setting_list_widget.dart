import 'package:app_config/app_config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/screens/about/about_screen.dart';
import 'package:settings/src/screens/setting/bloc/bloc.dart';
import 'package:settings/src/screens/setting/widgets/section_header_widget.dart';
import 'package:settings/src/screens/setting/widgets/section_tile_widget.dart';

class SettingListWidget extends StatelessWidget {
  const SettingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingBloc, SettingState>(
      listener: (context, state) {
        if (state.status == SettingStatus.error) {
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
      },
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: [
            SectionHeaderWidget(label: 'General'),
            SectionTileWidget(
              label: 'About',
              trailingIcon: Icons.navigate_next,
              leadingIcon: Icons.info,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
            SectionTileWidget(
              label: 'Privacy Policy',
              trailingIcon: Icons.open_in_browser,
              leadingIcon: Icons.privacy_tip,
              onTap: () {
                context.read<SettingBloc>().add(const OpenPrivacyPolicyUrl());
              },
            ),
            if (state.settingsDTO?.isInAppReviewEnabled == true) ...[
              SectionTileWidget(
                label: 'Feedback',
                leadingIcon: Icons.feedback,
                onTap: () {},
              ),
            ],
            if (state.settingsDTO?.isDevMenuEnabled == true) ...[
              SizedBox(height: context.space(factor: 5)),
              SectionHeaderWidget(label: 'Developer'),
              SectionTileWidget(
                label: 'Developer Option',
                leadingIcon: Icons.developer_mode_rounded,
                trailingIcon: Icons.navigate_next,
                onTap: () {},
              ),
            ],
          ],
        );
      },
    );
  }
}
