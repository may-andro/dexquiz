import 'package:equatable/equatable.dart';
import 'package:use_case/use_case.dart';

enum ScreenStatus {
  initial,
  loading,
  loaded,
  error,
}

class AboutState extends Equatable {
  final ScreenStatus status;
  final Failure? failure;

  const AboutState._({
    required this.status,
    required this.failure,
  });

  factory AboutState.initial() {
    return const AboutState._(
      status: ScreenStatus.initial,
      failure: null,
    );
  }

  AboutState copyWith({
    ScreenStatus? status,
    Failure? failure,
  }) {
    return AboutState._(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, failure];
}
