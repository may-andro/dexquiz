import 'package:either_dart/either.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:use_case/src/interceptor/interceptor.dart';
import 'package:use_case/src/model/failures.dart';
import 'package:use_case/src/use_case/base/base_use_case.dart';

void main() {
  group(BaseUseCase, () {
    late BaseUseCase<bool, String?, _TestUseCaseFailure,
        Either<_TestUseCaseFailure, bool>> baseUseCase;
    late _MockUseCaseInterceptor interceptor;

    setUpAll(() {
      registerFallbackValue(Left<_TestUseCaseFailure, bool>(_UnknownFailure()));
    });

    setUp(() {
      interceptor = _MockUseCaseInterceptor();
      UseCaseInterceptionHandler().register(interceptor);

      baseUseCase = _TestUseCase();
    });

    group('call', () {
      test(
          'should return $Right with true '
          'and call $UseCaseInterceptor when input is valid', () {
        const params = 'Testing';
        final result = baseUseCase(params);

        expect(result, isA<Right<_TestUseCaseFailure, bool>>());
        expect(
          result.fold(
            (_) => throw AssertionError('Expected a success'),
            (value) => value,
          ),
          isTrue,
        );

        verify(
          () => interceptor.onCall<dynamic>(baseUseCase.tag, params),
        ).called(1);
        verify(
          () => interceptor.onSuccess<Either<_TestUseCaseFailure, bool>>(
            baseUseCase.tag,
            Right<_TestUseCaseFailure, bool>(true),
          ),
        ).called(1);
        verifyNever(
          () => interceptor.onError(baseUseCase.tag, any(), any()),
        );
      });

      test(
          'should return $Right with false '
          'and call $UseCaseInterceptor when input is invalid', () {
        const params = 'Hi';
        final result = baseUseCase(params);

        expect(result, isA<Right<_TestUseCaseFailure, bool>>());
        expect(
          result.fold(
            (_) => throw AssertionError('Expected a success'),
            (value) => value,
          ),
          isFalse,
        );

        verify(
          () => interceptor.onCall<dynamic>(baseUseCase.tag, params),
        ).called(1);
        verify(
          () => interceptor.onSuccess<Either<_TestUseCaseFailure, bool>>(
            baseUseCase.tag,
            Right<_TestUseCaseFailure, bool>(false),
          ),
        ).called(1);
        verifyNever(
          () => interceptor.onError(baseUseCase.tag, any(), any()),
        );
      });

      test(
          'should throw $_EmptyFailure '
          'when param is empty string', () {
        const params = '';
        final result = baseUseCase(params);

        expect(result, isA<Left<_TestUseCaseFailure, bool>>());
        expect(
          result.fold(
            (value) => value,
            (_) => throw AssertionError('Expected a failure'),
          ),
          isA<_EmptyFailure>(),
        );

        verify(
          () => interceptor.onCall<dynamic>(baseUseCase.tag, params),
        ).called(1);
        verify(
          () => interceptor.onSuccess<Either<_TestUseCaseFailure, bool>>(
            baseUseCase.tag,
            Left<_TestUseCaseFailure, bool>(_EmptyFailure()),
          ),
        ).called(1);
        verifyNever(
          () => interceptor.onError(baseUseCase.tag, any(), any()),
        );
      });

      test('should handle known exception when thrown ', () {
        const params = 'test';
        final result = baseUseCase(params);

        expect(result, isA<Left<_TestUseCaseFailure, bool>>());
        expect(
          result.fold(
            (value) => value,
            (_) => throw AssertionError('Expected a failure'),
          ),
          isA<_UnknownFailure>(),
        );

        verify(
          () => interceptor.onCall<dynamic>(baseUseCase.tag, params),
        ).called(1);
        verify(
          () => interceptor.onSuccess<Either<_TestUseCaseFailure, bool>>(
            baseUseCase.tag,
            any(),
          ),
        ).called(1);
        verifyNever(
          () => interceptor.onError(baseUseCase.tag, any(), any()),
        );
      });

      test('should handle unknown exception when thrown ', () {
        try {
          baseUseCase(null);

          verify(
            () => interceptor.onCall<dynamic>(baseUseCase.tag, null),
          ).called(1);
          verifyNever(() => interceptor.onSuccess(baseUseCase.tag, any));
          verify(
            () => interceptor.onError(
              baseUseCase.tag,
              any(),
              any(),
            ),
          ).called(1);
        } catch (e) {
          //do nothing
        }
      });
    });
  });
}

class _MockUseCaseInterceptor extends Mock implements UseCaseInterceptor {}

class _KnownException implements Exception {}

sealed class _TestUseCaseFailure extends BasicFailure {
  const _TestUseCaseFailure({super.message, super.cause});
}

class _EmptyFailure extends _TestUseCaseFailure {
  static const _message = 'Input is empty/blank';

  const _EmptyFailure() : super(message: _message);
}

class _UnknownFailure extends _TestUseCaseFailure {
  const _UnknownFailure({super.message, super.cause});
}

class _TestUseCase extends BaseUseCase<bool, String?, _TestUseCaseFailure,
    Either<_TestUseCaseFailure, bool>> {
  @override
  String get tag => '$runtimeType';

  @override
  Either<_TestUseCaseFailure, bool> execute(String? param) {
    if (param!.isEmpty) {
      return const Left(_EmptyFailure());
    }

    try {
      if (param == 'test') {
        throw _KnownException();
      }
      return Right(param.length > 3);
    } catch (e, st) {
      return Left(_UnknownFailure(message: e.toString(), cause: st));
    }
  }
}
