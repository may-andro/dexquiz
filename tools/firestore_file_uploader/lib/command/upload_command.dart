import 'package:args/command_runner.dart';
import 'package:firestore_file_uploader/use_case/upload_use_case.dart';

class UploadCommand extends Command {
  final UploadUseCase _uploadUseCase;

  UploadCommand(this._uploadUseCase) {
    argParser.addOption(
      'flavor',
      abbr: 'f',
      help: 'Name of the flavor',
    );
    argParser.addOption(
      'credentials',
      abbr: 'c',
      help: 'JSON file path for service account credentials',
    );
    argParser.addOption(
      'data',
      abbr: 'p',
      help: 'JSON File path for data to upload',
    );
  }

  @override
  final name = "upload";

  @override
  final description = "Upload the firestore";

  @override
  void run() {
    final String flavor = argResults?['flavor'];
    final String credentialsFilePath = argResults?['credentials'];
    final String dataFilePath = argResults?['data'];
    _uploadUseCase.execute(flavor, credentialsFilePath, dataFilePath);
  }
}
