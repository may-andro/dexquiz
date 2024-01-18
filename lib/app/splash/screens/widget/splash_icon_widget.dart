import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/splash/screens/bloc/image_ticker_bloc.dart';
import 'package:dexquiz/app/splash/screens/utils/image_time_ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashIconWidget extends StatelessWidget {
  const SplashIconWidget(this._buildConfig, {super.key});

  final BuildConfig _buildConfig;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageTickerBloc(
        ImageTimeTicker(_buildConfig),
      )..add(const StartTickerEvent()),
      child: Center(
        child: SizedBox(
          width: context.screenWidth * 0.8,
          child: BlocBuilder<ImageTickerBloc, ImageTickerState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Image.asset(state.imagePath),
              );
            },
          ),
        ),
      ),
    );
  }
}
