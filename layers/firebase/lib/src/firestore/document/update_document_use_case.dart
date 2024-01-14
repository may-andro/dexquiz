import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/src/firestore/firestore_use_case.dart';

class UpdateDocumentParam {
  UpdateDocumentParam(
    this.data,
    this.collectionPath,
    this.documentPath,
  );

  final Map<String, dynamic> data;
  final String collectionPath;
  final String documentPath;
}

class UpdateDocumentUseCase
    extends FirestoreUseCase<void, UpdateDocumentParam> {
  UpdateDocumentUseCase(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> execute(UpdateDocumentParam param) {
    return _firebaseFirestore
        .collection(param.collectionPath)
        .doc(param.documentPath)
        .update(param.data);
  }
}
