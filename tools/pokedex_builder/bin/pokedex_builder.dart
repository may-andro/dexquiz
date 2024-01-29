import 'package:pokedex_builder/pokedex_builder.dart' as pokedex_builder;
import 'package:args/command_runner.dart';
import 'package:fimber/fimber.dart';

void main(List<String> arguments) {
  pokedex_builder.init();
  final runner = CommandRunner<void>(
    'pokedex_builder_tool',
    'A tool for creating the pokedex json for firestore',
  );
  runner.addCommand(pokedex_builder.createCommand);
  runner.run(arguments).catchError((error) => Fimber.e(error));
}
