import 'dart:convert';

import 'package:firestore_file_uploader/use_case/create_credentials_file_use_case.dart';
import 'package:test/test.dart';

void main() {
  group(CreateCredentialsFileUseCase, () {
    late CreateCredentialsFileUseCase createCredentialsFileUseCase;

    setUp(() {
      createCredentialsFileUseCase = CreateCredentialsFileUseCase();
    });

    group('execute', () {
      test('should return header map', () async {
        final credentials =
            "{\"type\": \"service_account\",  \"project_id\": \"test_ID\"}";
        final path = 'test_credentials.json';

        final file = await createCredentialsFileUseCase.execute(
          credentials: credentials,
          path: path,
        );

        expect(await file.exists(), isTrue);

        final fileContent = await file.readAsString();
        expect(jsonDecode(fileContent), jsonDecode(credentials));

        await file.delete();
      });
    });
  });
}
