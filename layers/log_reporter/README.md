This module is provides logging capabilities. 

## Features

- [x] `Local Logging`: `Logger` package is used for creating local logs.
- [x] `Remote Logging`: `Crashlytics` is used for remote logging.

## Getting started

The module exposes the `LogReporter` which can be used for logging `debug` and `error` logs.

## Usage

1. Import the module in the project in pubspec.yaml file.
   ```yaml
   use_case:
      path: layers/log_reporter
   ```
2. Use `GetIt` for the accessing the `LogReporter` for logging `debug` and `error` logs.

## Additional information

The module depends on the `Firebase` module and `Logger` package.
