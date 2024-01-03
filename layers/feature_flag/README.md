## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [CI](#ci)

## Getting Started

This modules defines all the feature flags used in the app. Here are the list of feature flags:
- `inAppReview`: Used to control if in app review feature is enabled or disabled.

The feature flag is cached in local database. The real value is stored in the firebase remote config.

## Usage

The module exposes various use cases for controlling the storage behaviour of the feature flags:
- `GetAllFeatureFlagsUseCase`
- `InitModuleUseCase`
- `IsFeatureEnabledUseCase`
- `SetFeatureEnabledUseCase`
- `UpdateCacheUseCase`

```yaml
use_case:
  path: layers/feature_flag
```

## CI

The layer has CI/CD for github action: `layer_feature_flag`.
