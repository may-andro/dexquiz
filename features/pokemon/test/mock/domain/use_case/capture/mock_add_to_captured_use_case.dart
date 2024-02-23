import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockAddToCapturedUseCase extends Mock implements AddToCapturedUseCase {
  void mockRight() {
    when(() => call(any())).thenAnswer((_) async => Right(null));
  }

  void mockLeft() {
    when(() => call(any())).thenAnswer((_) async => Left(UnknownFailure()));
  }
}
