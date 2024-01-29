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

The module exposes couple of use cases which can be used for sending events to `Firebase Analytics`.
- [x] `LogEventUseCase`
- [x] `SetDefaultParamsToEventUseCase`
- [x] `SetUserUseCase`

To enable analytics debug mode on Android, run the following command in your terminal, while your device(Android) is connected / Emulator is running.
```
adb shell setprop debug.firebase.analytics.app com.mayandro.dexquiz.kanto
```
or 
```
adb shell setprop debug.firebase.analytics.app com.mayandro.dexquiz.johto
```

Refer to [docs](https://firebase.flutter.dev/docs/analytics/overview) for more info.

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