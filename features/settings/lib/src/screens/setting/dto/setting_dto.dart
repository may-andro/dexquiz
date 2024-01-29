import 'package:equatable/equatable.dart';

class SettingsDTO extends Equatable {
  SettingsDTO(
    this.isInAppReviewEnabled,
    this.isDevMenuEnabled,
    this.appVersion,
  );

  final bool isInAppReviewEnabled;
  final bool isDevMenuEnabled;
  final String appVersion;

  @override
  List<Object?> get props => [
        isInAppReviewEnabled,
        isDevMenuEnabled,
        appVersion,
      ];
}
