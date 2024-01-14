import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase/src/firestore/document/delete_document_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(DeleteDocumentUseCase, () {
    late DeleteDocumentUseCase deleteDocumentUseCase;

    late FakeFirebaseFirestore fakeFirebaseFirestore;

    const data = {'data': '42'};
    const collectionPath = 'collectionPath';

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      deleteDocumentUseCase = DeleteDocumentUseCase(fakeFirebaseFirestore);
    });

    test('should delete data from document', () async {
      final collectionReference = fakeFirebaseFirestore.collection(
        collectionPath,
      );
      final documentReference = await collectionReference.add(data);
      final String documentPath = documentReference.path;

      await deleteDocumentUseCase.call(
        DeleteDocumentParam(collectionPath, documentPath),
      );

      final documentSnapshot =
          await collectionReference.doc(documentPath).get();

      expect(documentSnapshot.exists, false);
    });
  });
}
