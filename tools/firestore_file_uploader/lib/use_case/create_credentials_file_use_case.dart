import 'dart:convert';
import 'dart:io';

class CreateCredentialsFileUseCase {
  const CreateCredentialsFileUseCase();

  Future<File> execute({
    required String credentials,
    required String path,
  }) async {
    final Map<String, dynamic> collectionJson = jsonDecode(credentials);
    return File(path).writeAsString(
      const JsonEncoder.withIndent('  ').convert(collectionJson),
      mode: FileMode.write,
    );
  }
}
