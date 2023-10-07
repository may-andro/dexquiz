import 'dart:convert';
import 'dart:io';

class GetDataToUploadUseCase {
  const GetDataToUploadUseCase();

  Future<String> execute(String filePath) async {
    final fileToUpload = await File(filePath).readAsString();
    final jsonToUpload = json.decode(fileToUpload);
    print('GetDataToUploadUseCase.execute $jsonToUpload');
    return json.encode(jsonToUpload);
  }
}
