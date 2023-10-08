import 'package:firestore_file_uploader/firestore_file_uploader.dart'
    as firestore_file_uploader;
import 'package:args/command_runner.dart';

Future<void> main(List<String> args) async {
  firestore_file_uploader.init();
  final runner = CommandRunner<void>(
    'firestore_upload_tool',
    'A tool for uploading json FireStore',
  );
  runner.addCommand(firestore_file_uploader.uploadCommand);
  runner.addCommand(firestore_file_uploader.credentialBuilderCommand);
  runner.run(args).catchError((error) => print(error));
}
