import 'package:design_system/design_system.dart';
import 'package:dexquiz/demo/clear_grocery_cache.dart';
import 'package:dexquiz/demo/groceries_screen.dart';
import 'package:dexquiz/demo/grocery_cache.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:flutter/material.dart';

class DexQuizApp extends StatelessWidget {
  const DexQuizApp({required this.designSystem, super.key});

  final DesignSystem designSystem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DexQuiz',
      builder: (context, child) {
        return DSThemeBuilderWidget(
          brightness: context.platformBrightness,
          designSystem: designSystem,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: GroceriesScreen(
        appServiceLocator.get<GroceryCache>(),
        appServiceLocator.get<ClearGroceryCache>(),
      ),
    );
  }
}

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.background.primary.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              DSButtonWidget(
                label: 'Primary',
                onPressed: () {},
                variant: DSButtonVariant.primary,
                icon: Icons.access_time,
              ),
              DSButtonWidget(
                label: 'Secondary',
                onPressed: () {},
                variant: DSButtonVariant.secondary,
                icon: Icons.access_time,
              ),
              DSButtonWidget(
                label: 'Error',
                onPressed: () {},
                variant: DSButtonVariant.error,
                icon: Icons.access_time,
              ),
              DSButtonWidget(
                label: 'Text',
                onPressed: () {},
                variant: DSButtonVariant.text,
                icon: Icons.access_time,
              ),
              const DSDividerWidget(variant: DSDividerVariant.level1),
              DSIconButtonWidget(
                Icons.access_time,
                color: context.colorPalette.brand.primary,
                onPressed: () {},
              ),
              const DSErrorIconWidget(),
              const DSLoadingWidget()
            ],
          ),
        ),
      ),
    );
  }
}
