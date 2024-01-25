import 'package:equatable/equatable.dart';
import 'package:settings/src/screens/setting/dto/setting_dto.dart';
import 'package:use_case/use_case.dart' as use_case_failure;

enum SettingStatus {
  initial,
  loading,
  loaded,
  error,
}

class SettingState extends Equatable {
  final SettingStatus status;
  final SettingsDTO? settingsDTO;
  final use_case_failure.Failure? failure;

  const SettingState._({
    required this.status,
    required this.settingsDTO,
    required this.failure,
  });

  factory SettingState.initial() {
    return const SettingState._(
      status: SettingStatus.initial,
      settingsDTO: null,
      failure: null,
    );
  }

  SettingState copyWith({
    SettingStatus? status,
    SettingsDTO? settingsDTO,
    use_case_failure.Failure? failure,
  }) {
    return SettingState._(
      status: status ?? this.status,
      settingsDTO: settingsDTO ?? this.settingsDTO,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, settingsDTO, failure];
}
