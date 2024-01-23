import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:use_case/use_case.dart';

class OpenStoreListingUseCase
    extends BaseNoParamAsyncUseCase<void, UnknownFailure> {
  OpenStoreListingUseCase(this._appInReviewRepository);

  final AppInReviewRepository _appInReviewRepository;

  @override
  AsyncEither<UnknownFailure, void> execute() async {
    try {
      await _appInReviewRepository.openStoreListing();
      return Right(null);
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
