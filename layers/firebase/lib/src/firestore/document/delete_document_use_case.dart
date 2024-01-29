import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/firestore/firestore_use_case.dart';

class DeleteDocumentParam {
  DeleteDocumentParam(
    this.collectionPath,
    this.documentPath,
  );

  final String collectionPath;
  final String documentPath;
}

class DeleteDocumentUseCase
    extends FirestoreUseCase<void, DeleteDocumentParam> {
  DeleteDocumentUseCase(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> execute(DeleteDocumentParam param) {
    return _firebaseFirestore
        .collection(param.collectionPath)
        .doc(param.documentPath)
        .delete();
  }
}
