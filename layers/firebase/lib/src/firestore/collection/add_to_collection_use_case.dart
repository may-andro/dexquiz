import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/firestore/firestore_use_case.dart';

class AddToCollectionParam {
  AddToCollectionParam(
    this.data,
    this.collectionPath,
  );

  final Map<String, dynamic> data;
  final String collectionPath;
}

class AddToCollectionUseCase
    extends FirestoreUseCase<void, AddToCollectionParam> {
  AddToCollectionUseCase(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> execute(AddToCollectionParam param) {
    return _firebaseFirestore.collection(param.collectionPath).add(param.data);
  }
}
