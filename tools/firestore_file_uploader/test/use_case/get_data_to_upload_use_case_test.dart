import 'package:firestore_file_uploader/use_case/get_data_to_upload_use_case.dart';
import 'package:test/test.dart';

void main() {
  group(GetDataToUploadUseCase, () {
    late GetDataToUploadUseCase getDataToUploadUseCase;

    setUp(() {
      getDataToUploadUseCase = GetDataToUploadUseCase();
    });
    group('execute', () {
      test('should return the valid json', () async {
        final path =
            '../firestore_file_uploader/test/test_data/test_pokedex.json';

        final result = await getDataToUploadUseCase.execute(path);

        expect(
          result,
          '{"fields":{"pokemons":{"arrayValue":{"values":[{"mapValue":{"fields":{"index":{"integerValue":"2"},"name":{"stringValue":"test"},"base_experience":{"integerValue":"142"},"weight":{"integerValue":"130"},"height":{"integerValue":"10"},"image_url":{"stringValue":"test.png"},"abilities":{"arrayValue":{"values":[{"stringValue":"overgrow"},{"stringValue":"chlorophyll"}]}},"moves":{"arrayValue":{"values":[{"stringValue":"swords-dance"}]}},"types":{"arrayValue":{"values":[{"stringValue":"grass"}]}},"stats":{"mapValue":{"fields":{"hp":{"integerValue":"60"},"attack":{"integerValue":"62"},"defense":{"integerValue":"63"},"special-attack":{"integerValue":"80"},"special-defense":{"integerValue":"80"},"speed":{"integerValue":"60"}}}}}}}]}}}}',
        );
      });
    });
  });
}
