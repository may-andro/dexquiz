import 'package:app_config/src/data/repository/app_in_review_repository_impl.dart';
import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mocktail/mocktail.dart';

class MockInAppReview extends Mock implements InAppReview {
  void mockOpenStoreListing() {
    when(() => openStoreListing()).thenAnswer((_) async {});
  }

  void mockIsAvailable(bool expected) {
    when(() => isAvailable()).thenAnswer((_) async => expected);
  }

  void mockRequestReview() {
    when(() => requestReview()).thenAnswer((_) async {});
  }
}

void main() {
  group(AppInReviewRepositoryImpl, () {
    late AppInReviewRepository appInReviewRepository;

    late MockInAppReview mockInAppReview;

    setUp(() {
      mockInAppReview = MockInAppReview();

      appInReviewRepository = AppInReviewRepositoryImpl(mockInAppReview);
    });

    group('openStoreListing', () {
      test('should call $MockInAppReview', () {
        mockInAppReview.mockOpenStoreListing();

        appInReviewRepository.openStoreListing();

        verify(() => mockInAppReview.openStoreListing()).called(1);
      });
    });

    group('requestReview', () {
      test('should call $MockInAppReview when review is available', () async {
        mockInAppReview.mockIsAvailable(true);
        mockInAppReview.mockRequestReview();

        await appInReviewRepository.requestReview();

        verify(() => mockInAppReview.requestReview()).called(1);
      });

      test(
          'should not call $MockInAppReview and throw $AppInReviewException'
          ' when review is available', () async {
        mockInAppReview.mockIsAvailable(false);
        mockInAppReview.mockRequestReview();

        expect(
          appInReviewRepository.requestReview(),
          throwsA(isA<AppInReviewException>()),
        );

        verifyNever(() => mockInAppReview.requestReview());
      });
    });
  });
}
