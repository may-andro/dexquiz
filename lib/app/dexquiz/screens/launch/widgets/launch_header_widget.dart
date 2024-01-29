import 'package:design_system/design_system.dart';
import 'package:dexquiz/app/dexquiz/screens/launch/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchHeaderWidget extends StatelessWidget {
  const LaunchHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        if (state is Success) {
          return DSAssetImageWidget(
            state.imageHeader,
            height: context.height * 0.25,
            width: context.width * 0.7,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
