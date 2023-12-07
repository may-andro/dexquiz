import 'package:firebase/src/crashlytics/is_crashlytics_enabled_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockIsCrashlyticsEnabledUseCase extends Mock
    implements IsCrashlyticsEnabledUseCase {
  void mockCall(bool isEnabled) {
    when(() => call()).thenReturn(isEnabled);
  }
}
