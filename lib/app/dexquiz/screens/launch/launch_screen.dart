import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/components/components.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LaunchBloc(
        appServiceLocator.get<BuildConfig>(),
        appServiceLocator.get<IsFeatureEnabledUseCase>(),
      )..add(OnStart()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: DSResponsiveContainerWidget(
            mobileBuilder: (BuildContext context) {
              return const LaunchMobileWidget();
            },
            tabletBuilder: (BuildContext context) {
              return const LaunchTabletWidget();
            },
            desktopBuilder: (BuildContext context) {
              return const LaunchDesktopWidget();
            },
          ),
        ),
      ),
    );
  }
}
