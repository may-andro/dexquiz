import 'package:error_reporter/src/exception/fatal_exception.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@internal
class IsFatalErrorUseCase {
  bool call(Object error) {
    if (error is FlutterError && error.toString().contains('RenderFlex')) {
      return false;
    }

    return error is Error || error is FatalException;
  }
}
