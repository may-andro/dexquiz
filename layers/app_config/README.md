## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [CI](#ci)

## Getting started

This modules provides all the app configuration properties. These properties are stored on the Firebase under `app_config` collection.

## Usage

The module exposes the use case for getting the `AppConfigs`
- `GetAppConfigUseCase`

```yaml
app_config:
  path: layers/app_config
```

## CI

The layer has CI/CD for github action: `layer_app_config.yaml`.