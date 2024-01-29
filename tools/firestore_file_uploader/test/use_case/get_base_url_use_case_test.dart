import 'package:firestore_file_uploader/use_case/get_base_url_use_case.dart';
import 'package:test/test.dart';

void main() {
  group(GetBaseUrlUseCase, () {
    late GetBaseUrlUseCase getBaseUrlUseCase;

    setUp(() {
      getBaseUrlUseCase = GetBaseUrlUseCase();
    });
    group('execute', () {
      test('should return the valid Uri', () {
        final testUri = Uri.parse(
          'https://firestore.googleapis.com/v1/projects/test-dexquiz/databases/(default)/documents/pokedex/test/',
        );

        final result = getBaseUrlUseCase.execute('test');

        expect(result, testUri);
      });
    });
  });
}
