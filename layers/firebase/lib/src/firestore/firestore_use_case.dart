import 'package:firebase/src/firestore/firebase_exception.dart';

abstract class FirestoreUseCase<O, I> {
  const FirestoreUseCase();

  Future<O> execute(I param);

  Future<O> call(I param) async {
    try {
      return execute(param);
    } catch (error, st) {
      throw FirestoreException(error, st);
    }
  }
}
