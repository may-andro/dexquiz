import 'package:firebase/src/firestore/collection/add_to_collection_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import '../map_list_matcher.dart';

void main() {
  group(AddToCollectionUseCase, () {
    late AddToCollectionUseCase addToCollectionUseCase;

    late FakeFirebaseFirestore fakeFirebaseFirestore;

    const data = {'data': '42'};
    const collectionPath = 'collectionPath';

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      addToCollectionUseCase = AddToCollectionUseCase(fakeFirebaseFirestore);
    });

    test('should add data to collection', () async {
      await addToCollectionUseCase.call(
        AddToCollectionParam(data, collectionPath),
      );

      final querySnapshot =
          await fakeFirebaseFirestore.collection('collectionPath').get();
      final actualDataList =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

      expect(actualDataList, const MapListContains(data));
    });
  });
}
