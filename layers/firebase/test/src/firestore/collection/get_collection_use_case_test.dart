import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase/src/firestore/collection/get_collection_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../map_list_matcher.dart';

void main() {
  group(GetCollectionUseCase, () {
    late GetCollectionUseCase getCollectionUseCase;

    late FakeFirebaseFirestore fakeFirebaseFirestore;
    const data = {'data': '42'};
    const collectionPath = 'collectionPath';

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      getCollectionUseCase = GetCollectionUseCase(fakeFirebaseFirestore);
    });

    test('should get all collection', () async {
      await fakeFirebaseFirestore.collection(collectionPath).add(data);

      final querySnapshot = await getCollectionUseCase.call(collectionPath);
      final dataList = querySnapshot.docs.map((e) => e.data()).toList();

      expect(dataList, const MapListContains(data));
    });
  });
}
