# dexquiz

A quiz on pokemon

## Getting Started

## Flavoring

The app has two flavors `Kanto` & `Johto`.
For more detail refer to the [PR](https://github.com/may-andro/dexquiz/pull/1). 
For further read, visit [here](https://docs.flutter.dev/deployment/flavors).
Also checkout this [video](https://www.youtube.com/watch?v=Vhm1Cv2uPko) to see in action.

## Build Environment

The support two environment `staging` & `prod`. Based on environment certain feature gets affected:
1. Firebase: Firebase is enabled only in `prod` environment.

## Running the app

Use the below command for running the `kanto` flavor in `staging` environment
```shell
flutter run lib/flavors/kanto/main_kanto.dart --flavor kanto  --dart-define=build_env=staging
```

Use the below command for running the `johto` flavor in `staging` environment
```shell
flutter run lib/flavors/johto/main_johto.dart --flavor johto  --dart-define=build_env=staging
```

Use the below command for running the `kanto` flavor in `prod` environment
```shell
flutter run lib/flavors/kanto/main_kanto.dart --flavor kanto  --dart-define=build_env=prod
```

Use the below command for running the `kanto` flavor in `prod` environment
```shell
flutter run lib/flavors/johto/main_johto.dart --flavor johto  --dart-define=build_env=prod
```