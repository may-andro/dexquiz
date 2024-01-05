import 'package:feature_flag/src/use_case/update_cache_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:use_case/use_case.dart';

class MockUpdateCacheUseCase extends Mock implements UpdateCacheUseCase {
  mockCall() => when(call).thenAnswer((_) async => const Right(null));
}
