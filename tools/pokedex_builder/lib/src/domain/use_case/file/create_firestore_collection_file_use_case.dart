import 'dart:convert';
import 'dart:io';

class CreateFirestoreCollectionFileUseCase {
  Future<File> execute(String path, Map<String, dynamic> collectionJson) {
    return File(path).writeAsString(
      const JsonEncoder.withIndent('  ').convert(collectionJson),
      mode: FileMode.write,
    );
  }
}
