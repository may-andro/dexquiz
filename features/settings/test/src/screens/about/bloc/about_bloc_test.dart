import 'package:app_config/app_config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:settings/src/screens/about/bloc/bloc.dart';
import 'package:use_case/use_case.dart';

class MockOpenUrlUseCase extends Mock implements OpenUrlUseCase {
  void mockCallRight() {
    when(() => call(any())).thenAnswer(
      (invocation) async => Right(null),
    );
  }

  void mockCallLeft(OpenUrlFailure failure) {
    when(() => call(any())).thenAnswer(
      (invocation) async => Left(failure),
    );
  }
}

void main() {
  group(AboutBloc, () {
    late AboutBloc aboutBloc;

    late MockOpenUrlUseCase mockOpenUrlUseCase;

    setUp(() {
      mockOpenUrlUseCase = MockOpenUrlUseCase();

      aboutBloc = AboutBloc(mockOpenUrlUseCase);
    });

    blocTest(
      'should emit $AboutState with $Failure when $OpenUrl event received',
      build: () => aboutBloc,
      setUp: () {
        mockOpenUrlUseCase.mockCallLeft(InvalidUrlFailure());
      },
      act: (bloc) => bloc.add(OpenUrl()),
      expect: () => <AboutState>[
        AboutState.initial().copyWith(
          status: ScreenStatus.error,
          failure: InvalidUrlFailure(),
        ),
      ],
    );
  });
}
