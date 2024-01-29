import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase/src/firestore/document/add_document_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AddDocumentUseCase, () {
    late AddDocumentUseCase addToCollectionUseCase;

    late FakeFirebaseFirestore fakeFirebaseFirestore;

    const data = {'data': '42'};
    const collectionPath = 'collectionPath';
    const documentPath = 'documentPath';

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      addToCollectionUseCase = AddDocumentUseCase(fakeFirebaseFirestore);
    });

    test('should add data to document', () async {
      await addToCollectionUseCase.call(
        AddDocumentParam(data, collectionPath, documentPath),
      );

      final documentReference =
          fakeFirebaseFirestore.collection(collectionPath).doc(documentPath);
      final actualDocumentSnapshot = await documentReference.get();

      expect(actualDocumentSnapshot.data(), data);
    });
  });
}
