import 'package:firebase/firebase.dart';
import 'package:get_it/get_it.dart';
import 'package:log_reporter/src/log/composite_log_reporter.dart';
import 'package:log_reporter/src/log/firebase_log_reporter.dart';
import 'package:log_reporter/src/log/local_log_reporter.dart';
import 'package:log_reporter/src/log/log_reporter.dart';
import 'package:logger/logger.dart';

void setupPackageDependencies(final GetIt getIt) {
  getIt.registerSingleton(Logger());
  final firebaseLogReporter = FirebaseLogReporter(
    getIt.get<CrashlyticsLogUseCase>(),
  );
  final localLogReporter = LocalLogReporter(
    getIt.get<Logger>(),
  );
  getIt.registerSingleton<LogReporter>(
    CompositeLogReporter([
      firebaseLogReporter,
      localLogReporter,
    ]),
  );
}
