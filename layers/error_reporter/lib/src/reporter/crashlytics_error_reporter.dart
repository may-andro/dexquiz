import 'package:error_reporter/src/exception/app_exception.dart';
import 'package:error_reporter/src/blacklist_error/blacklist_error.dart';
import 'package:error_reporter/src/fatal_error/fatal_error.dart';
import 'package:error_reporter/src/reporter/error_reporter.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:log_reporter/log_reporter.dart';
import 'package:meta/meta.dart';

typedef RecordErrorUseCase = CrashlyticsRecordErrorUseCase;
typedef RecordFlutterErrorUseCase = CrashlyticsFlutterRecordErrorUseCase;

@internal
class CrashlyticsErrorReporter implements ErrorReporter {
  CrashlyticsErrorReporter(
    this._isBlacklistedErrorUseCase,
    this._isFatalErrorUseCase,
    this._fatalErrorHandlerUseCase,
    this._recordErrorUseCase,
    this._recordFlutterErrorUseCase,
    this._logReporter,
  );

  final IsBlacklistedErrorUseCase _isBlacklistedErrorUseCase;
  final IsFatalErrorUseCase _isFatalErrorUseCase;
  final FatalErrorHandlerUseCase _fatalErrorHandlerUseCase;
  final RecordErrorUseCase _recordErrorUseCase;
  final RecordFlutterErrorUseCase _recordFlutterErrorUseCase;
  final LogReporter _logReporter;

  @override
  Future<void> init() async {
    FlutterError.onError = (FlutterErrorDetails details) => _onError(
          details.exception,
          details.stack ?? StackTrace.empty,
          flutterErrorDetails: details,
        );
  }

  @override
  Future<void> reportError<T extends AppException>({
    required T exception,
    required StackTrace stackTrace,
    String? tag,
  }) async {
    _onError(exception, stackTrace);
    _logReporter.error(
      'Error occurred due to $exception',
      tag: tag,
      error: exception,
      stacktrace: stackTrace,
    );
  }

  @override
  void Function(Object error, StackTrace st) get globalErrorHandler => _onError;

  Future<void> _onError(
    Object error,
    StackTrace stackTrace, {
    FlutterErrorDetails? flutterErrorDetails,
  }) async {
    if (_isFatalErrorUseCase(error)) {
      _handleFatalError(error, stackTrace);
      return;
    }

    _handleNonFatalError(
      error,
      stackTrace,
      flutterErrorDetails: flutterErrorDetails,
    );
  }

  Future<void> _handleFatalError(
    Object error,
    StackTrace stackTrace,
  ) async {
    if (!_isBlacklistedErrorUseCase(error)) {
      await _recordErrorUseCase(error, stackTrace, isFatal: true);
    }

    await _fatalErrorHandlerUseCase(error);
  }

  Future<void> _handleNonFatalError(
    Object error,
    StackTrace stackTrace, {
    FlutterErrorDetails? flutterErrorDetails,
  }) async {
    if (_isBlacklistedErrorUseCase(error)) return;

    if (flutterErrorDetails != null) {
      await _recordFlutterErrorUseCase(flutterErrorDetails);
    } else {
      await _recordErrorUseCase(error, stackTrace);
    }
  }
}
