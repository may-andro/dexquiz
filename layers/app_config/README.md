## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [CI](#ci)

## Getting started

This modules provides all the app configuration properties. These properties are stored on the Firebase under `app_config` collection.

The module exposes use cases for other app configurations like:

- [x] `In App Review`: This provides app reviews feature.
- [x] `Open External App`: This allows means to open external app for email and urls.
- [x] `Package Info`: This provide package related info. 

## Usage

```yaml
app_config:
  path: layers/app_config
```

## CI

The layer has CI/CD for github action: `layer_app_config.yaml`.