import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:dexquiz/module_configurator.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

class DexQuizApp extends StatelessWidget {
  const DexQuizApp({
    required this.designSystem,
    required this.navigationObservers,
    required this.buildConfig,
    super.key,
  });

  final DesignSystem designSystem;
  final List<NavigatorObserver> navigationObservers;
  final BuildConfig buildConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DexQuiz',
      navigatorObservers: navigationObservers,
      builder: (context, child) {
        return DSThemeBuilderWidget(
          brightness: context.platformBrightness,
          designSystem: designSystem,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: FirestoreDemoWidget(buildConfig: buildConfig),
    );
  }
}

class FirestoreDemoWidget extends StatefulWidget {
  const FirestoreDemoWidget({required this.buildConfig, super.key});

  final BuildConfig buildConfig;

  @override
  State<FirestoreDemoWidget> createState() => _FirestoreDemoWidgetState();
}

class _FirestoreDemoWidgetState extends State<FirestoreDemoWidget> {
  late final GetDocumentUseCase getDocumentUseCase;

  @override
  void initState() {
    getDocumentUseCase = appServiceLocator.get<GetDocumentUseCase>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.background.primary.color,
      body: SafeArea(
        child: FutureBuilder(
            future: getDocumentUseCase.call(GetDocumentParam(
              'pokedex',
              widget.buildConfig.buildFlavor.name,
            )),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                if (data != null && data.isNotEmpty) {
                  final list = data.keys.toList();
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return DSTextWidget(
                        list[index],
                        color: context.colorPalette.neutral.grey9,
                        style: context.typography.bodyLarge,
                      );
                    },
                  );
                }
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DSTextWidget(
                      'Empty List',
                      color: context.colorPalette.neutral.grey9,
                      style: context.typography.bodyLarge,
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DSTextWidget(
                      'Error happened ${snapshot.error}',
                      color: context.colorPalette.neutral.grey9,
                      style: context.typography.bodyLarge,
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

class DevMenuScreen extends StatefulWidget {
  const DevMenuScreen({required this.buildConfig, super.key});

  final BuildConfig buildConfig;

  @override
  State<DevMenuScreen> createState() => _DevMenuScreenState();
}

class _DevMenuScreenState extends State<DevMenuScreen> {
  @override
  void initState() {
    appServiceLocator.get<SetUserUseCase>().call('Test');
    appServiceLocator.get<LogEventUseCase>().call(
      'flutter_screen',
      parameters: {
        'screen_name': 'Dev Menu Screen',
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.buildConfig.buildFlavor.name.toUpperCase()}-[${widget.buildConfig.buildEnvironment.name.toUpperCase()}]",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await appServiceLocator.get<ResetFeatureFlagsUseCase>().call();
              await appServiceLocator
                  .get<LogEventUseCase>()
                  .call('delete_button');
              setState(() {});
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
              future: appServiceLocator.get<GetFeatureFlagsUseCase>().call(),
              builder: (context, snapshot) {
                final setFeatureEnabledUseCase =
                    appServiceLocator.get<SetFeatureFlagStatusUseCase>();
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
                            onChanged: (flag) async {
                              await setFeatureEnabledUseCase(
                                SetFeatureFlagStatusParam(
                                  feature,
                                  isEnabled: flag,
                                ),
                              );
                              await appServiceLocator
                                  .get<LogEventUseCase>()
                                  .call(feature.name);
                              setState(() {});
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
