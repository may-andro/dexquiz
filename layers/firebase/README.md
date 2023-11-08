This module is provides firebase capabilities like analytics, crashlytics and remote configs in form of use cases.

The module also initialises the firebase for the root project.

## Features

### Crashlytics

The module exposes couple of use cases which can be used for logging and crash reporting.
- [x] `CrashlyticsForceCrashUseCase`
- [x] `CrashlyticsLogUseCase`
- [x] `CrashlyticsRecordErrorUseCase`
- [x] `CrashlyticsFlutterRecordErrorUseCase`
- [x] `IsCrashlyticsEnabledUseCase`
- [x] `SetCrashlyticsEnabledUseCase`
- [x] `SetCrashlyticsUserUseCase`

### Analytics

TODO: This will be added later

### Remote Config

TODO: This will be added later

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

1. Import the module in the project in pubspec.yaml file.
   ```yaml
   use_case:
      path: layers/firebase
   ```
2. Initialise the firebase using `preSetUpModule()` callback.