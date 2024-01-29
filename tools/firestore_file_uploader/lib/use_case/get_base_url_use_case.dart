class GetBaseUrlUseCase {
  const GetBaseUrlUseCase();

  Uri execute(String flavor) {
    final projectId = '$flavor-dexquiz';
    final collectionName = 'pokedex';
    final documentName = flavor;
    final url =
        'https://firestore.googleapis.com/v1/projects/$projectId/databases/(default)/documents/$collectionName/$documentName/';
    return Uri.parse(url);
  }
}
