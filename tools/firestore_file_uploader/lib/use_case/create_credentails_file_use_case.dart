import 'dart:convert';
import 'dart:io';

class CreateCredentialsFileUseCase {
  const CreateCredentialsFileUseCase();

  Future<File> execute({
    required String credentials,
    required String path,
  }) async {

    //final fileToUpload = await File('../data/credentials/kanto_dexquiz.json').readAsString();
    //final jsonToUpload = json.decode(fileToUpload);
    final Map<String, dynamic> collectionJson = jsonDecode(credentials);
    print('collectionJson  $collectionJson');
    return File(path).writeAsString(
      const JsonEncoder.withIndent('  ').convert(collectionJson),
      mode: FileMode.write,
    );
  }
}
