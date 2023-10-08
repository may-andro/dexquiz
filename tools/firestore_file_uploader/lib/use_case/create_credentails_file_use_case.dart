import 'dart:convert';
import 'dart:io';

class CreateCredentialsFileUseCase {
  const CreateCredentialsFileUseCase();

  Future<File> execute({
    required String credentials,
    required String path,
  }) {
    return File(path).writeAsString(
      const JsonEncoder.withIndent('  ').convert(jsonDecode(credentials)),
      mode: FileMode.write,
    );
  }
}
