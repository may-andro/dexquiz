import 'package:app_config/src/domain/repository/external_app_launcher_repository.dart';
import 'package:url_launcher/url_launcher.dart';

final class ExternalAppLauncherRepositoryImpl
    implements ExternalAppLauncherRepository {
  @override
  Future<bool> openEmailApp(
    String email, {
    String? subject,
    String? body,
  }) async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }),
    );
    return launchUrl(emailUri);
  }

  @override
  Future<bool> openWebUrl(String url, [bool forceWebView = false]) async {
    final uri = Uri.tryParse(url.trim());
    if (uri == null || uri.toString().trim().isEmpty) {
      throw InvalidUrlException();
    }

    if (!await canLaunchUrl(uri)) {
      throw UrlLaunchFailedException();
    }

    return launchUrl(
      uri,
      mode: forceWebView
          ? LaunchMode.inAppWebView
          : LaunchMode.externalApplication,
    );
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((MapEntry<String, String> e) {
      return '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}';
    }).join('&');
  }
}
