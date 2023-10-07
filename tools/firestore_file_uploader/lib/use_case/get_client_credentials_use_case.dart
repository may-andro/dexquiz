import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/googleapis_auth.dart';

class GetClientCredentialsUseCase {
  const GetClientCredentialsUseCase();

  Future<ServiceAccountCredentials> execute(String filePath) async {
    print('Path to Upload $filePath');
    final credentialsFile = await File(filePath).readAsString();
    print('File content $credentialsFile');
    final credentialsJson = json.decode(credentialsFile);
    print('credentialsJson $credentialsJson');
    return ServiceAccountCredentials.fromJson(credentialsJson);
  }
}
