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

The module exposes couple of use cases which can be used for getting and setting values of remote configs.
- [x] `GetAllFeatureFlagsUseCase`
- [x] `InitModuleUseCase`
- [x] `IsFeatureEnabledUseCase`
- [x] `SetFeatureEnabledUseCase`
- [x] `UpdateCacheUseCase`

## Getting started

To get started refer to `lib/src/main.dart`. This is the entry point of the module.

`preSetUpModule`: This method is called to initialize the `Firebase` in the client project.
`setUpModule`: This methods setup the dependency graph for the module.
`postSetUpModule`: This methods exposed the post set functionality for the module.

## Usage

1. Import the module in the project in pubspec.yaml file.
   ```yaml
   use_case:
      path: layers/firebase
   ```