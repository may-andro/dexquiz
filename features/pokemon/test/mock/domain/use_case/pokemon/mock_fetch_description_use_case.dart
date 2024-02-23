import 'package:mocktail/mocktail.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:use_case/use_case.dart';

class MockFetchDescriptionUseCase extends Mock
    implements FetchDescriptionUseCase {
  void mockRight(String description) {
    when(() => call(any())).thenAnswer((_) async => Right(description));
  }

  void mockLeft(FetchDescriptionFailure failure) {
    when(() => call(any())).thenAnswer((_) async => Left(failure));
  }
}
