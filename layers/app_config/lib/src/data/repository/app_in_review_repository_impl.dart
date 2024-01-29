import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:in_app_review/in_app_review.dart';

class AppInReviewRepositoryImpl implements AppInReviewRepository {
  AppInReviewRepositoryImpl(this.inAppReview);

  final InAppReview inAppReview;

  @override
  Future<void> openStoreListing() {
    return inAppReview.openStoreListing();
  }

  @override
  Future<void> requestReview() async {
    if (await inAppReview.isAvailable()) {
      return inAppReview.requestReview();
    }
    throw AppInReviewException();
  }
}
