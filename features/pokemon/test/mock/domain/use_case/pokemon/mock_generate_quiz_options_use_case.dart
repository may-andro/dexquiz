import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockGenerateQuizOptionUseCase extends Mock
    implements GenerateQuizOptionUseCase {
  void mockRight(Map<int, String> expected) {
    when(() => call(any())).thenAnswer((_) async => Right(expected));
  }

  void mockLeft(QuizOptionFailure failure) {
    when(() => call(any())).thenAnswer((_) async => Left(failure));
  }
}
