import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase/src/firestore/document/update_document_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(UpdateDocumentUseCase, () {
    late UpdateDocumentUseCase updateDocumentUseCase;

    late FakeFirebaseFirestore fakeFirebaseFirestore;

    const data = {'data': '42'};
    const collectionPath = 'collectionPath';
    const documentPath = 'documentPath';

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();

      updateDocumentUseCase = UpdateDocumentUseCase(fakeFirebaseFirestore);
    });

    test('should update the document', () async {
      final documentReference =
          fakeFirebaseFirestore.collection(collectionPath).doc(documentPath);
      await documentReference.set(data);

      final Map<String, dynamic> dataUpdate = {'data': '43'};

      await updateDocumentUseCase.call(
        UpdateDocumentParam(dataUpdate, collectionPath, documentPath),
      );

      final actualDocumentSnapshot = await documentReference.get();

      expect(actualDocumentSnapshot.data(), dataUpdate);
    });
  });
}
