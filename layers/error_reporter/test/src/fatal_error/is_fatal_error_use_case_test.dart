import 'package:error_reporter/src/exception/fatal_exception.dart';
import 'package:error_reporter/src/fatal_error/is_fatal_error_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/src/exception/test_fatal_exception.dart';

void main() {
  group(IsFatalErrorUseCase, () {
    late IsFatalErrorUseCase useCase;

    setUp(() {
      useCase = IsFatalErrorUseCase();
    });

    group('call', () {
      test('should return true when error is type $Error', () {
        final result = useCase(ArgumentError());

        expect(result, isTrue);
      });

      test(
          'should return true when error is $FlutterError '
          '& does not contains RenderFlex keyword', () {
        final result = useCase(FlutterError('Test'));

        expect(result, isTrue);
      });

      test('should return true when error is type $FatalException', () {
        final result = useCase(TestFatalException());

        expect(result, isTrue);
      });

      test(
          'should return false when error is $FlutterError '
          '& contains RenderFlex keyword', () {
        final result = useCase(FlutterError('RenderFlex'));

        expect(result, isFalse);
      });

      test('should return false when error is type $Exception', () {
        final result = useCase(Exception('RenderFlex'));

        expect(result, isFalse);
      });
    });
  });
}
