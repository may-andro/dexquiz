import 'package:design_system/design_system.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:feature_flag/feature_flag.dart';
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
      home: const DevMenuScreen(),
    );
  }
}

class DevMenuScreen extends StatefulWidget {
  const DevMenuScreen({super.key});

  @override
  State<DevMenuScreen> createState() => _DevMenuScreenState();
}

class _DevMenuScreenState extends State<DevMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feature Flags"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                appServiceLocator.get<UpdateCacheUseCase>().call();
              });
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      backgroundColor: context.colorPalette.background.primary.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FutureBuilder(
              future: appServiceLocator.get<GetAllFeatureFlagsUseCase>().call(),
              builder: (context, snapshot) {
                final setFeatureEnabledUseCase =
                    appServiceLocator.get<SetFeatureEnabledUseCase>();
                if (snapshot.hasData) {
                  if (snapshot.data?.isRight ?? false) {
                    return ListView.builder(
                      itemCount: snapshot.data!.right.length,
                      itemBuilder: (_, index) {
                        final feature =
                            snapshot.data!.right.keys.elementAt(index);
                        final isEnabled =
                            snapshot.data!.right.values.elementAt(index);
                        return ListTile(
                          title: DSTextWidget(
                            feature.name,
                            color: context.colorPalette.neutral.grey9,
                            style: context.typography.bodyLarge,
                          ),
                          trailing: Switch(
                            value: isEnabled,
                            onChanged: (flag) {
                              setState(() {
                                setFeatureEnabledUseCase(
                                  SetFeatureEnabledParam(
                                    feature,
                                    isEnabled: flag,
                                  ),
                                );
                              });
                            },
                          ),
                        );
                      },
                    );
                  }
                  if (snapshot.data?.isLeft ?? false) {
                    return const CircularProgressIndicator();
                  }
                  return const CircularProgressIndicator();
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
