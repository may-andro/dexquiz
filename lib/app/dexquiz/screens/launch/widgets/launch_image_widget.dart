import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchImageWidget extends StatelessWidget {
  const LaunchImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        if (state is Success) {
          return DSLottieWidget(
            state.imageLaunch,
            size: context.shortestSide * 0.7,
            repeat: true,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
