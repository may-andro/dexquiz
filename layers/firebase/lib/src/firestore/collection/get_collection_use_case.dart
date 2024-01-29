import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/firestore/firestore_use_case.dart';

class GetCollectionUseCase
    extends FirestoreUseCase<QuerySnapshot<Map<String, dynamic>>, String> {
  GetCollectionUseCase(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> execute(String collectionPath) {
    return _firebaseFirestore.collection(collectionPath).get();
  }
}
