import 'package:app_config/app_config.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/module_configurator.dart';
import 'package:settings/src/screens/setting/bloc/bloc.dart';
import 'package:settings/src/screens/setting/widgets/widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return SettingBloc(
          settingsServiceLocator.get<BuildConfig>(),
          settingsServiceLocator.get<AppConfig>(),
          settingsServiceLocator.get<IsFeatureEnabledUseCase>(),
          settingsServiceLocator.get<GetAppInfoUseCase>(),
          settingsServiceLocator.get<OpenUrlUseCase>(),
        )..add(OnStart());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colorPalette.brand.primary.color,
          iconTheme: IconTheme.of(context).copyWith(
            color: context.colorPalette.brand.onPrimary.color,
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: DSTextWidget(
            'Setting',
            color: context.colorPalette.brand.onPrimary,
            style: context.typography.titleLarge,
          ),
        ),
        body: Stack(
          children: [
            SettingListWidget(),
            VersionTextWidget(),
          ],
        ),
      ),
    );
  }
}
