import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/firestore/firestore_use_case.dart';

class GetDocumentParam {
  GetDocumentParam(
    this.collectionPath,
    this.documentPath,
  );

  final String collectionPath;
  final String documentPath;
}

class GetDocumentUseCase
    extends FirestoreUseCase<Map<String, dynamic>?, GetDocumentParam> {
  GetDocumentUseCase(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Map<String, dynamic>?> execute(GetDocumentParam param) async {
    final snapshot = await _firebaseFirestore
        .collection(param.collectionPath)
        .doc(param.documentPath)
        .get();
    return snapshot.data();
  }
}
