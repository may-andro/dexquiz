import 'package:args/command_runner.dart';
import 'package:firestore_file_uploader/use_case/create_credentails_file_use_case.dart';

class CredentialBuilderCommand extends Command {
  CredentialBuilderCommand(this._createCredentialsFileUseCase) {
    argParser.addOption(
      'credentials',
      abbr: 'c',
      help: 'firebase service account credentials',
    );
    argParser.addOption(
      'path',
      abbr: 'p',
      help: 'JSON File path to store the creds',
    );
  }

  final CreateCredentialsFileUseCase _createCredentialsFileUseCase;

  @override
  final name = "credential_builder";

  @override
  final description = "Parse the credentials and convert to json";

  @override
  void run() {
    final credentials = argResults?['credentials'];
    final filePath = argResults?['path'];
    print('Let see: $credentials $filePath');
    _createCredentialsFileUseCase.execute(
      credentials: credentials,
      path: filePath,
    );
  }
}
