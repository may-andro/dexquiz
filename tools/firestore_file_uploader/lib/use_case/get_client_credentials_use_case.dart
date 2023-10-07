import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/googleapis_auth.dart';

class GetClientCredentialsUseCase {
  const GetClientCredentialsUseCase();

  Future<ServiceAccountCredentials> execute(String filePath) async {
    print('GetClientCredentialsUseCase.execute $filePath');
    final credentialsFile = await File(filePath).readAsString();
    print('GetClientCredentialsUseCase.execute $credentialsFile');
    final credentialsJson = json.decode(credentialsFile);
    print('GetClientCredentialsUseCase.execute $credentialsJson');
    return ServiceAccountCredentials.fromJson(credentialsJson);
  }
}
