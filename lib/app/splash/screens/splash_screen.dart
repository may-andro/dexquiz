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
    final isDescriptive = buildConfig.buildEnvironment.isSplashDescriptive;
    return BlocProvider(
      create: (_) => SplashBloc(
        const DIGraphService(),
        moduleConfigurators,
      )..add(StartSetUp()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              switch (state) {
                case SetUpCompeted():
                  {
                    onInitializationSuccessful(state.designSystem);
                    return const SizedBox.shrink();
                  }
                case SetUpError():
                  {
                    return Column(
                      children: [
                        const Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.screenWidth * 0.8,
                            child: Image.asset('assets/images/splash.png'),
                          ),
                        ),
                        const Spacer(),
                        SplashErrorWidget(state.cause)
                      ],
                    );
                  }
                case SetUpProgress():
                  {
                    return Column(
                      children: [
                        const Spacer(),
                        SplashIconWidget(buildConfig),
                        const Spacer(),
                        SplashInfoWidget(
                          state.setUpStatus,
                          isEnabled: isDescriptive,
                        ),
                        SplashMessageWidget(
                          state.progress,
                          isEnabled: !isDescriptive,
                        ),
                      ],
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
