abstract class ExternalAppLauncherRepository {
  Future<bool> openWebUrl(String url);

  Future<bool> openEmailApp(
    String email, {
    String? subject,
    String? body,
  });
}

class InvalidUrlException implements Exception {}

class UrlLaunchFailedException implements Exception {}
