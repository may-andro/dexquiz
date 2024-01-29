import 'dart:convert';
import 'dart:io';

import 'package:pokedex_builder/src/domain/use_case/file/create_firestore_collection_file_use_case.dart';
import 'package:test/test.dart';

void main() {
  group(CreateFirestoreCollectionFileUseCase, () {
    late CreateFirestoreCollectionFileUseCase useCase;

    setUp(() {
      useCase = CreateFirestoreCollectionFileUseCase();
    });

    group('execute', () {
      test('should write a JSON file with the provided data', () async {
        final Directory tempDir = Directory.systemTemp;
        final String testFilePath = '${tempDir.path}/test_collection.json';
        final Map<String, dynamic> testCollectionJson = {
          'field1': 'value1',
          'field2': 42,
        };

        final File resultFile = await useCase.execute(
          testFilePath,
          testCollectionJson,
        );

        expect(await resultFile.exists(), true);

        // Read the content of the file and parse it as JSON.
        final String fileContent = await resultFile.readAsString();
        final Map<String, dynamic> parsedJson = json.decode(fileContent);

        expect(parsedJson, testCollectionJson);

        await resultFile.delete();
      });
    });
  });
}
