import 'package:dexquiz/build_config.dart';
import 'package:dexquiz/dexquiz_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> runFlavor(final BuildConfig buildConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp();

  await FirebaseAnalytics.instance.logEvent(
    name: 'testing',
    parameters: <String, dynamic>{
      'flavor': buildConfig.buildFlavor.name,
    },
  );

  runApp(const DexQuizApp());
}
