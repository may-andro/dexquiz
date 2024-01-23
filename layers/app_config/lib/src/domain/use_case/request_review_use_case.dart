import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:use_case/use_case.dart';

class RequestReviewUseCase
    extends BaseNoParamAsyncUseCase<void, UnknownFailure> {
  RequestReviewUseCase(this._appInReviewRepository);

  final AppInReviewRepository _appInReviewRepository;

  @override
  AsyncEither<UnknownFailure, void> execute() async {
    try {
      await _appInReviewRepository.requestReview();
      return Right(null);
    } on AppInReviewException catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownFailure(
          message: 'In app review is not available',
          cause: error,
        ),
      );
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownFailure(
          message: 'In app review failed due to error: $error',
          cause: error,
        ),
      );
    }
  }
}
