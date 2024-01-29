import 'package:either_dart/either.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:use_case/src/interceptor/interceptor.dart';
import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/base_no_param_use_case.dart';

void main() {
  group(BaseNoParamUseCase, () {
    late BaseNoParamUseCase<int, NoFailure, Either<NoFailure, int>>
        baseNoParamUseCase;
    late _MockUseCaseInterceptor interceptor;

    setUpAll(() {
      registerFallbackValue(Left<NoFailure, int>(NoFailure()));
    });

    setUp(() {
      interceptor = _MockUseCaseInterceptor();
      UseCaseInterceptionHandler().register(interceptor);
    });

    group('success call', () {
      setUp(() => baseNoParamUseCase = _SuccessTestUseCase());

      test(
          'should return $Right '
          'and call $UseCaseInterceptor', () {
        final result = baseNoParamUseCase();

        expect(result, isA<Right<NoFailure, int>>());
        expect(
          result.fold<int>(
            (_) => throw AssertionError('Expected a success'),
            (value) => value,
          ),
          100,
        );

        verify(
          () => interceptor.onCall<dynamic>(baseNoParamUseCase.tag, null),
        ).called(1);
        verify(
          () => interceptor.onSuccess<Either<NoFailure, int>>(
            baseNoParamUseCase.tag,
            Right(100),
          ),
        ).called(1);
        verifyNever(
          () => interceptor.onError(baseNoParamUseCase.tag, any(), any()),
        );
      });
    });

    group('failure call', () {
      setUp(() => baseNoParamUseCase = _FailureTestUseCase());

      test(
          'should return $Left '
          'and call $UseCaseInterceptor', () {
        final result = baseNoParamUseCase();

        expect(result, isA<Left<NoFailure, int>>());
        expect(
          result.fold(
            (value) => value,
            (_) => throw AssertionError('Expected a failure'),
          ),
          isA<NoFailure>(),
        );

        verify(
          () => interceptor.onCall<dynamic>(baseNoParamUseCase.tag, null),
        ).called(1);
        verify(
          () => interceptor.onSuccess<Either<NoFailure, int>>(
            baseNoParamUseCase.tag,
            any(),
          ),
        ).called(1);
        verifyNever(
          () => interceptor.onError(baseNoParamUseCase.tag, any(), any()),
        );
      });
    });

    group('unknown exception call', () {
      setUp(() => baseNoParamUseCase = _ExceptionTestUseCase());

      test(
          'should return $Left '
          'and call $UseCaseInterceptor', () {
        try {
          baseNoParamUseCase();

          verify(
            () => interceptor.onCall<void>(baseNoParamUseCase.tag, null),
          ).called(1);
          verifyNever(
            () => interceptor.onSuccess(baseNoParamUseCase.tag, any),
          );
          verify(
            () => interceptor.onError(baseNoParamUseCase.tag, any(), any()),
          ).called(1);
        } catch (e) {
          //do nothing
        }
      });
    });
  });
}

class _MockUseCaseInterceptor extends Mock implements UseCaseInterceptor {}

class _SuccessTestUseCase
    extends BaseNoParamUseCase<int, NoFailure, Either<NoFailure, int>> {
  @override
  Either<NoFailure, int> execute() {
    return const Right(100);
  }

  @override
  String get tag => '$runtimeType';
}

class _FailureTestUseCase
    extends BaseNoParamUseCase<int, NoFailure, Either<NoFailure, int>> {
  @override
  Either<NoFailure, int> execute() {
    return Left(NoFailure());
  }

  @override
  String get tag => '$runtimeType';
}

class _ExceptionTestUseCase
    extends BaseNoParamUseCase<int, NoFailure, Either<NoFailure, int>> {
  @override
  Either<NoFailure, int> execute() {
    throw UnsupportedError('Not supported');
  }

  @override
  String get tag => '$runtimeType';
}
