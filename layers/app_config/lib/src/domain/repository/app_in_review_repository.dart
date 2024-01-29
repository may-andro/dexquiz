abstract class AppInReviewRepository {
  Future<void> requestReview();

  Future<void> openStoreListing();
}

class AppInReviewException implements Exception {}
