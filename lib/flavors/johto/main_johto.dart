import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:dexquiz/flavors/johto/firebase_options_johto.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _buildConfig = BuildConfig(
  buildEnvironment: BuildEnvironment.prod,
  buildFlavor: BuildFlavor.jhoto,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
    name: 'johto-dexquiz',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const DexQuizApp());
}
