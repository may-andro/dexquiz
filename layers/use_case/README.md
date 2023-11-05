UseCase module creates the base structure which each use case needs. 

## Features

1. Supports various types of use cases: `sync`, `async` and `stream`.
2. Exposed `UseCaseInterceptor` which can be used to intercepts various phase of execution of use case.
3. Uses `Either` class concept. The Either class represents a type that can hold one of two possible values: success or failure.


## Getting started

1. Import the module in the project in pubspec.yaml file.
   ```yaml
   use_case:path: layers/use_case
   ```
2. Use the mason brick to generate your use case.
   ```shell
   mason make use_case --name product_fetch --useCaseType sync --returnType Product --inputType int
   ```


## Usage

1. `UseCaseInterceptor`: This is an abstract for setting the interceptor for use case which can be used to monitor the different phases.
   ```dart
    class LoggerUseCaseInterceptor implements UseCaseInterceptor {
      @override
      void onCall<Params>(String tag, Params params) {
        Log.log(tag, 'Called with ${params.toString()}');
      }
      
      @override
      void onError(String tag, Object error, StackTrace? stackTrace) {
        Log.error(tag, error, stackTrace);
      }
   
      @override
      void onSuccess<Type>(String tag, Type result) {
        Log.log(tag, 'Success with ${result.toString()}');
      }
   }
   ```
2. `UseCaseInterceptionHandler`: This class is used to register a `UseCaseInterceptor`.
3. There are two types of base sync use cases: `BaseSyncUseCase` & `BaseNoParamSyncUseCase`.
   One can use `BaseNoParamSyncUseCase` if there are no input params needed in the use case. For example:
   ```dart
   class FooUseCase extends BaseNoParamSyncUseCase<int, FooUseCaseFailure> {
      @override
      Either<FooUseCaseFailure, int> execute() {}
   }
   ```
   In case of input params we use `BaseSyncUseCase`. In case of more than one parameter one can pass  a model object. For example:
   ```dart
   class FooUseCase extends BaseSyncUseCase<int, Person, FooUseCaseFailure> {
      @override
      Either<FooUseCaseFailure, int> execute(Person param) {}
   }
   ```
4. There are two types of base async use cases: `BaseAsyncUseCase` & `BaseNoParamAsyncUseCase`.
   One can use `BaseNoParamAsyncUseCase` if there are no input params needed and return type is `Future`. For example:
   ```dart
   class FooUseCase extends BaseNoParamAsyncUseCase<void, FooUseCaseFailure> {
      @override
      AsyncEither<FooUseCaseFailure, void> execute() async {}
   }
   ```
   In case of input params we use `BaseAsyncUseCase`. In case of more than one parameter one can pass a model object. For example:
   ```dart
   class FooUseCase extends BaseAsyncUseCase<int, int, FooUseCaseFailure> {
      @override
      AsyncEither<FooUseCaseFailure, int> execute(int param) async {}
   }
   ```
5. There are two types of base async use cases: `BaseStreamUseCase` & `BaseNoParamStreamUseCase`.
   One can use `BaseNoParamStreamUseCase` if there are no input params needed and return type is `Stream`. For example:
   ```dart
   class FooUseCase extends BaseNoParamStreamUseCase<void, FooUseCaseFailure> {
      @override
      StreamEither<FooUseCaseFailure, void> execute() async {}
   }
   ```
   In case of input params we use `BaseStreamUseCase`. In case of more than one parameter one can pass a model object. For example:
   ```dart
   class FooUseCase extends BaseStreamUseCase<int, int, FooUseCaseFailure> {
      @override
      StreamEither<FooUseCaseFailure, int> execute(int param) async {}
   }
   ```
6. `Failure`: A base class to define all kinds of failure during the execution of the use case. This approach restricts to use case for possible issues which can occur while execution and understood easily by presentation layer.
   ```dart
   sealed class FooUseCaseFailure extends BasicFailure {
      const FooUseCaseFailure({super.message, super.cause});
   }
   
   class EmptyFailure extends FooUseCaseFailure {
      const _UnknownFailure({super.message, super.cause});
   }
   ```


## Additional information

The module has following dependencies:
- [x] either_dart: ^0.3.0
- [x] equatable: ^2.0.3

