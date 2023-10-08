import 'package:firestore_file_uploader/command/command.dart';
import 'package:firestore_file_uploader/command/credentails_builder_command.dart';
import 'package:firestore_file_uploader/di/di.dart';

void init() => setUpDI();

UploadCommand get uploadCommand => locator<UploadCommand>();

CredentialBuilderCommand get credentialBuilderCommand =>
    locator<CredentialBuilderCommand>();
