sealed class SettingEvent {
  const SettingEvent();
}

final class OnStart extends SettingEvent {
  const OnStart();
}

final class OpenPrivacyPolicyUrl extends SettingEvent {
  const OpenPrivacyPolicyUrl();
}
