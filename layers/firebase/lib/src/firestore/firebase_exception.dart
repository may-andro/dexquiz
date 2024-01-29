class FirestoreException implements Exception {
  FirestoreException(this.cause, this.stackTrace);

  final Object cause;
  final StackTrace stackTrace;
}
