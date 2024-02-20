import 'dart:math';

import 'package:use_case/use_case.dart';

const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
final _randomOptions = 5;

class GenerateQuizOptionUseCase
    extends BaseAsyncUseCase<Map<int, String>, String?, QuizOptionFailure> {
  @override
  AsyncEither<QuizOptionFailure, Map<int, String>> execute(String? name) async {
    try {
      if (name == null) {
        return Left(
          InvalidNameFailure(message: 'Pokemon name is not correct'),
        );
      }
      final nameChars = name.toUpperCase().split('');
      final randomChars = _getRandomString(_randomOptions);
      final result = <int, String>{};
      nameChars.addAll(randomChars.split(''));
      nameChars.shuffle();
      for(int i = 0; i< nameChars.length; i++) {
        result[i] = nameChars[i];
      }
      return Right(result);
    } catch (error, st) {
      reportError(error, st);
      return Left(
        UnknownQuizOptionFailure(
          message: 'Failed to generate quiz options',
          cause: error,
        ),
      );
    }
  }

  String _getRandomString(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(Random().nextInt(_chars.length)),
      ),
    );
  }
}

sealed class QuizOptionFailure extends BasicFailure {
  const QuizOptionFailure({super.message, super.cause});
}

final class InvalidNameFailure extends QuizOptionFailure {
  const InvalidNameFailure({super.message, super.cause});
}

final class UnknownQuizOptionFailure extends QuizOptionFailure {
  const UnknownQuizOptionFailure({super.message, super.cause});
}
