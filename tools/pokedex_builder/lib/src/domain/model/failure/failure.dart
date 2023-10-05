import 'package:equatable/equatable.dart';

abstract class Failure {
  const Failure._();
}

abstract class BasicFailure extends Equatable implements Failure {
  const BasicFailure({this.message, this.cause});

  final String? message;

  final Object? cause;

  String get _typeString => runtimeType.toString();

  @override
  String toString() {
    final message = this.message;
    final cause = this.cause;
    return <String>[
      _typeString,
      if (message != null) ': $message',
      if (cause != null) '. Caused by: $cause',
    ].join();
  }

  @override
  List<Object?> get props => [message, cause];

  @override
  bool? get stringify => null;
}

/// Basic Error
class NetworkFailure extends BasicFailure {
  const NetworkFailure({super.message, super.cause});
}

class DiskFailure extends BasicFailure {
  const DiskFailure({super.message, super.cause});
}

class NoFailure implements Failure {}
