import 'package:args/command_runner.dart';
import 'package:fimber/fimber.dart';
import 'package:pokedex_builder/src/domain/use_case/use_case.dart';

class CreateCommand extends Command {
  final FetchPokedexUseCase _fetchPokedexUseCase;
  final CreateFirestoreCollectionUseCase _createCollectionUseCase;
  final CreateFirestoreCollectionFileUseCase _createFileUseCase;

  CreateCommand(
    this._fetchPokedexUseCase,
    this._createCollectionUseCase,
    this._createFileUseCase,
  ) {
    argParser.addOption(
      'flavor',
      abbr: 'f',
      help: 'Name of the flavor',
    );
    argParser.addOption(
      'path',
      abbr: 'p',
      help: 'JSON file path to store the fetched pokedex',
    );
  }

  @override
  final name = "build";

  @override
  final description = "Build the pokedex";

  @override
  Future<void> run() async {
    final String flavor = argResults?['flavor'];
    final String filePath = argResults?['path'];
    try {
      final pokemons = await _fetchPokedexUseCase.execute(flavor);
      pokemons.fold(
        (failure) {
          switch (failure) {
            case UnknownRegionFailure():
              Fimber.e('UnknownRegionFailure : ${failure.region}');
            case InvalidRangeFailure():
              Fimber.e(
                'InvalidRangeFailure : start: ${failure.startValue} and end: ${failure.endValue}',
              );
            case ParsingFailure():
              Fimber.e('ParsingFailure : Failed to parse the model');
            case ServerFailure():
              Fimber.e(
                'ServerFailure : Failed with error code: ${failure.serverCode}',
              );
            case UnknownFailure():
              Fimber.e(
                'UnknownFailure : Unknown cause ${failure.cause}',
              );
          }
        },
        (pokemons) async {
          Fimber.i('Pokedex fetched with: ${pokemons.length} pokemons');
          final firebaseCollection = await _createCollectionUseCase.execute(
            pokemons,
          );
          final file = await _createFileUseCase.execute(
            filePath,
            firebaseCollection,
          );
          Fimber.i('File created for $flavor at: ${file.path}');
        },
      );
    } catch (e) {
      Fimber.e('Pokedex fetch failed with error : ${e.toString()}');
    }
  }
}
