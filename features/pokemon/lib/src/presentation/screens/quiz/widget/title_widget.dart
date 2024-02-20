import 'package:design_system/design_system.dart';
import 'package:pokemon/assets/assets.gen.dart' as pokemon_assets;
import 'package:flutter/material.dart';
import 'package:pokemon/src/presentation/screens/quiz/widget/hint_button_widget.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: context.space(factor: 2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: context.space(factor: 2)),
              DSIconButtonWidget(
                Icons.close,
                iconColor: context.colorPalette.background.onPrimary,
                buttonColor: context.colorPalette.background.primary,
                onPressed: () => Navigator.pop(context),
                size: DSIconButtonSize.medium,
                elevation: context.dimens.elevationLevel2,
              ),
              Spacer(),
              DSAssetImageWidget(
                pokemon_assets.Assets.images.quiz.title.path,
                width: context.shortestSide * 0.7,
                height: context.shortestSide * 0.1,
                package: 'pokemon',
              ),
              Spacer(),
              HintButtonWidget(),
              SizedBox(width: context.space(factor: 2)),
            ],
          ),
          SizedBox(height: context.space(factor: 2)),
          DSDividerWidget(),
        ],
      ),
    );
  }
}
