import 'package:use_case/use_case.dart';
import 'package:either_dart/either.dart';

{{#isWithoutParam}}
{{#isSyncUseCase}}
class {{name.pascalCase()}} extends BaseNoParamSyncUseCase<{{returnType}}, {{name.pascalCase()}}Failure> {
  {{name.pascalCase()}}(this._{{repository.camelCase()}});

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  @override
  Either<{{name.pascalCase()}}Failure, {{returnType}}> execute() {
    // Implement the business logic for the Use Case here
    // For example, you can use the repository or service to fetch data and process it
    try {
      // Handle known failures if needed
      // if (known failure condition) {
      //   return Left(Known{{name.pascalCase()}}Failure());
      // }
      final result = _{{repository.camelCase()}}.getSomething();
      return Right(result);
    } on NetworkException catch (e, st) {
      reportError(e, st);
      return Left(Network{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    } on Exception catch(e, st) {
      reportError(e, st);
      return Left(Unknown{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    }
  }
}
{{/isSyncUseCase}}
{{#isAsyncUseCase}}
class {{name.pascalCase()}} extends BaseNoParamAsyncUseCase<{{returnType}}, {{name.pascalCase()}}Failure> {
  {{name.pascalCase()}}(this._{{repository.camelCase()}});

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  @override
  AsyncEither<{{name.pascalCase()}}Failure, {{returnType}}> execute() async {
    // Implement the business logic for the Use Case here
    // For example, you can use the repository or service to fetch data and process it

    try {
      // Handle known failures if needed
      // if (known failure condition) {
      //   return Left(Known{{name.pascalCase()}}Failure());
      // }
      final result =  _{{repository.camelCase()}}.getSomething();
      return Right(result);
    } on NetworkException catch (e, st) {
      reportError(e, st);
      return Left(Network{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    } on Exception catch(e, st) {
      reportError(e, st);
      return Left(Unknown{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    }
  }
}
{{/isAsyncUseCase}}
{{#isStreamUseCase}}
class {{name.pascalCase()}} extends BaseNoParamStreamUseCase<{{returnType}}, {{name.pascalCase()}}Failure> {
  {{name.pascalCase()}}(this._{{repository.camelCase()}});

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  @override
  StreamEither<{{name.pascalCase()}}Failure, {{returnType}}> execute() async* {
    // Implement the business logic for the Use Case here
    // For example, you can use the repository or service to fetch data and process it

    try {
      // Handle known failures if needed
      // if (known failure condition) {
      //   yield Left(Known{{name.pascalCase()}}Failure());
      // }
      final result = _{{repository.camelCase()}}.getSomething();
      yield Right(result);
    } on NetworkException catch (e, st) {
      reportError(e, st);
      yield Left(Network{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    } on Exception catch(e, st) {
      reportError(e, st);
      yield Left(Unknown{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    }
  }
}
{{/isStreamUseCase}}
{{/isWithoutParam}}
{{^isWithoutParam}}
{{#isSyncUseCase}}
class {{name.pascalCase()}} extends BaseSyncUseCase<{{returnType}}, {{inputType}}, {{name.pascalCase()}}Failure> {
  {{name.pascalCase()}}(this._{{repository.camelCase()}});

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  @override
  Either<{{name.pascalCase()}}Failure, {{returnType}}> execute({{inputType}} param) {
    // Implement the business logic for the Use Case here
    // For example, you can use the repository or service to fetch data and process it

    try {
      // Handle known failures if needed
      // if (known failure condition) {
      //   return Left(Known{{name.pascalCase()}}Failure());
      // }
      final result = _{{repository.camelCase()}}.getSomething();
      return Right(result);
    } on NetworkException catch (e, st) {
      reportError(e, st);
      return Left(Network{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    } on Exception catch(e, st) {
      reportError(e, st);
      return Left(Unknown{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    }
  }
}
{{/isSyncUseCase}}
{{#isAsyncUseCase}}
class {{name.pascalCase()}} extends BaseAsyncUseCase<{{returnType}}, {{inputType}}, {{name.pascalCase()}}Failure> {
  {{name.pascalCase()}}(this._{{repository.camelCase()}});

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  @override
  AsyncEither<{{name.pascalCase()}}Failure, {{returnType}}> execute({{inputType}} param) async {
    // Implement the business logic for the Use Case here
    // For example, you can use the repository or service to fetch data and process it

    try {
    // Handle known failures if needed
    // if (known failure condition) {
    //   return Left(Known{{name.pascalCase()}}Failure());
    // }
    final result = _{{repository.camelCase()}}.getSomething();
    return Right(result);
    } on NetworkException catch (e, st) {
      reportError(e, st);
      return Left(Network{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    } on Exception catch(e, st) {
      reportError(e, st);
      return Left(Unknown{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    }
  }
}
{{/isAsyncUseCase}}
{{#isStreamUseCase}}
class {{name.pascalCase()}} extends BaseStreamUseCase<{{returnType}}, {{inputType}}, {{name.pascalCase()}}Failure> {
  {{name.pascalCase()}}(this._{{repository.camelCase()}});

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  @override
  StreamEither<{{name.pascalCase()}}Failure, {{returnType}}> execute({{inputType}} param) async* {
    // Implement the business logic for the Use Case here
    // For example, you can use the repository or service to fetch data and process it

    try {
      // Handle known failures if needed
      // if (known failure condition) {
      //   yield Left(Known{{name.pascalCase()}}Failure());
      // }
      final result = _{{repository.camelCase()}}.getSomething();
      yield Right(result);
    } on NetworkException catch (e, st) {
      reportError(e, st);
      yield Left(Network{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    } on Exception catch(e, st) {
      reportError(e, st);
      yield Left(Unknown{{name.pascalCase()}}Failure(message: e.toString(), cause: e));
    }
  }
}
{{/isStreamUseCase}}
{{/isWithoutParam}}

sealed class {{name.pascalCase()}}Failure extends BasicFailure {
  const {{name.pascalCase()}}Failure({super.message, super.cause});
}

class Known{{name.pascalCase()}}Failure extends {{name.pascalCase()}}Failure {
  const Known{{name.pascalCase()}}Failure({super.message, super.cause});
}

class Unknown{{name.pascalCase()}}Failure extends {{name.pascalCase()}}Failure {
  const Unknown{{name.pascalCase()}}Failure({super.message, super.cause});
}

class Network{{name.pascalCase()}}Failure extends {{name.pascalCase()}}Failure {
  const Network{{name.pascalCase()}}Failure({super.message, super.cause});
}

class NetworkException implements Exception {}
