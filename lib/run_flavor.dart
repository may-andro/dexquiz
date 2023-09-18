import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const DexQuizApp());
}
