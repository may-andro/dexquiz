import 'package:fimber/fimber.dart';
import 'package:pokedex_builder/src/command/build_command.dart';
import 'package:pokedex_builder/src/di/locator.dart';

void init() {
  setUpDI();
  Fimber.plantTree(DebugTree());
}

CreateCommand get createCommand => locator<CreateCommand>();
