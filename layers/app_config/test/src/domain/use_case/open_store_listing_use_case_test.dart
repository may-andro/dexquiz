import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:app_config/src/domain/use_case/open_store_listing_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockAppInReviewRepository extends Mock implements AppInReviewRepository {
  void mockOpenStoreListing() {
    when(() => openStoreListing()).thenAnswer((_) async {});
  }

  void mockOpenStoreListingThrowsException() {
    when(() => openStoreListing()).thenThrow(AppInReviewException());
  }
}

void main() {
  group(OpenStoreListingUseCase, () {
    late MockAppInReviewRepository mockAppInReviewRepository;

    late OpenStoreListingUseCase openStoreListingUseCase;

    setUp(() {
      mockAppInReviewRepository = MockAppInReviewRepository();

      openStoreListingUseCase = OpenStoreListingUseCase(
        mockAppInReviewRepository,
      );
    });

    group('call', () {
      test('should return $Right when there is no exception', () async {
        mockAppInReviewRepository.mockOpenStoreListing();

        final result = await openStoreListingUseCase.call();

        expect(result.isRight, true);
      });

      test('should return $Left when there is exception', () async {
        mockAppInReviewRepository.mockOpenStoreListingThrowsException();

        final result = await openStoreListingUseCase.call();

        expect(result.isLeft, true);
      });
    });
  });
}
