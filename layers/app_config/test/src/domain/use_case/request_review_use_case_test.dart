import 'package:app_config/src/domain/repository/app_in_review_repository.dart';
import 'package:app_config/src/domain/use_case/request_review_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockAppInReviewRepository extends Mock implements AppInReviewRepository {
  void mockRequestReview() {
    when(() => requestReview()).thenAnswer((_) async {});
  }

  void mockRequestReviewThrowsException() {
    when(() => requestReview()).thenThrow(Exception());
  }
}

void main() {
  group(RequestReviewUseCase, () {
    late MockAppInReviewRepository mockAppInReviewRepository;

    late RequestReviewUseCase requestReviewUseCase;

    setUp(() {
      mockAppInReviewRepository = MockAppInReviewRepository();

      requestReviewUseCase = RequestReviewUseCase(
        mockAppInReviewRepository,
      );
    });

    group('call', () {
      test('should return $Right when there is no exception', () async {
        mockAppInReviewRepository.mockRequestReview();

        final result = await requestReviewUseCase.call();

        expect(result.isRight, true);
      });

      test('should return $Left when there is exception', () async {
        mockAppInReviewRepository.mockRequestReviewThrowsException();

        final result = await requestReviewUseCase.call();

        expect(result.isLeft, true);
      });
    });
  });
}
