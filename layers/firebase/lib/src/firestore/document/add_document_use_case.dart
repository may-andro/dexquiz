import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/firestore/firestore_use_case.dart';

class AddDocumentParam {
  AddDocumentParam(
    this.data,
    this.collectionPath,
    this.documentPath,
  );

  final Map<String, dynamic> data;
  final String collectionPath;
  final String documentPath;
}

class AddDocumentUseCase extends FirestoreUseCase<void, AddDocumentParam> {
  AddDocumentUseCase(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> execute(AddDocumentParam param) {
    return _firebaseFirestore
        .collection(param.collectionPath)
        .doc(param.documentPath)
        .set(param.data);
  }
}
