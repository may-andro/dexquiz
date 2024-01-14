import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase/src/firestore/document/get_document_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(GetDocumentUseCase, () {
    late GetDocumentUseCase getDocumentUseCase;

    late FakeFirebaseFirestore fakeFirebaseFirestore;

    const data = {'data': '42'};
    const collectionPath = 'collectionPath';
    const documentPath = 'documentPath';

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();

      getDocumentUseCase = GetDocumentUseCase(fakeFirebaseFirestore);
    });

    test('should get all documents', () async {
      final documentReference =
          fakeFirebaseFirestore.collection(collectionPath).doc(documentPath);
      await documentReference.set(data);

      final expectedDocumentSnapshot = await documentReference.get();
      final expectedData = expectedDocumentSnapshot.data();

      final result = await getDocumentUseCase.call(
        GetDocumentParam(collectionPath, documentPath),
      );

      expect(result, expectedData);
    });
  });
}
