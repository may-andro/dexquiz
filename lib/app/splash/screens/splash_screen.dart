import 'package:core/core.dart';
import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/bloc/bloc.dart';
import 'package:dexquiz/app/splash/screens/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    required this.buildConfig,
    required this.moduleConfigurators,
    required this.onInitializationSuccessful,
    super.key,
  });

  final BuildConfig buildConfig;
  final List<ModuleConfigurator> moduleConfigurators;
  final Function(DesignSystem) onInitializationSuccessful;

  @override
  Widget build(BuildContext context) {
    final isSplashDescriptive =
        buildConfig.buildEnvironment.isSplashDescriptive;
    return BlocProvider(
      create: (_) => SplashBloc(
        buildConfig,
        moduleConfigurators,
      )..add(OnStartEvent()),
      child: Scaffold(
        body: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
          if (state.designSystem != null) {
            onInitializationSuccessful(state.designSystem!);
            return const SizedBox.shrink();
          }

          if (state.error != null) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),
                  const SplashIconWidget('assets/images/splash.png'),
                  const Spacer(),
                  SplashErrorWidget(state.error)
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                SplashIconWidget(state.imagePath),
                const Spacer(),
                if (state.setUpStatus != null) ...[
                  SplashInfoWidget(
                    state.setUpStatus!,
                    isEnabled: isSplashDescriptive,
                  ),
                  SplashMessageWidget(
                    (state.setUpStatus!.length / SetUpStatus.values.length),
                    isEnabled: !isSplashDescriptive,
                  ),
                ]
              ],
            ),
          );
        }),
      ),
    );
  }
}
