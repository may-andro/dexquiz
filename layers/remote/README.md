## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [CI](#ci)

## Getting Started

This module is used for providing networking capabilities to the app.

The module is using `Dio` package for the rest api calls. The module also exposed bunch of `RemoteApiException` for handling various kinds of error.

## Usage

The module exposes client class for remote api calls
- `RestApiService`

```yaml
use_case:
  path: layers/remote
```

## CI

The layer has CI/CD for github action: `layer_remote.yaml`.